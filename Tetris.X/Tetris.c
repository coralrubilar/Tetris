


/*
 * File:   Tetris.c  - final project
 * Author: Adi Yaari, Coral Rubilar
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "System/system.h"
#include "System/delay.h"
#include "oledDriver/oledC.h"
#include "oledDriver/oledC_colors.h"
#include "oledDriver/oledC_shapes.h"


#define S1_PORT  PORTAbits.RA11
#define S2_PORT  PORTAbits.RA12
#define S1_TRIS  TRISAbits.TRISA11
#define S2_TRIS  TRISAbits.TRISA12
#define PRESSED     0
#define NOT_PRESSED 1
#define INPUT       1
#define OUTPUT      0


//size of the screen 
#define ROWS 96 //look in it
#define COLS 96
//
#define TRUE 1
#define FALSE 0


//timer for time
unsigned long int timer = 10000;

void init_system(){
    SYSTEM_Initialize();
    oledC_setBackground(OLEDC_COLOR_SKYBLUE);
    oledC_clearScreen();
    //btn
    S1_TRIS=INPUT;//s1 is input
    S2_TRIS=INPUT;//s2 is input
    TRISAbits.TRISA8=OUTPUT;//LED 1 OUTPUT
    TRISAbits.TRISA9=OUTPUT;//LED 2 OUTPUT
    //timer
    T1CONbits.TON=1;                        //SET THE TON BIT TO 1 TO ENABLE THE TIMER
    T1CONbits.TSIDL=1;
    T1CONbits.TCS=0;
    T1CONbits.TCKPS=0b11;                   //CHOOSING THE TIMER PRESCALER RATIO 
    PR1=timer;                                //CHOOSE THE LIMT FOR THE TIMER 1
    IFS0bits.T1IF=0;                        //THE FLAG 
    IPC0bits.T1IP=0b001;                    //PRIORTY
    IEC0bits.T1IE=1;                        //ENABLE 
    INTCON2bits.GIE=1;                      //GLOBAL ENABLE FOR THE PROGRAM               
    //Potentiometer ON
    ANSCbits.ANSC0 = 1 ;
    AD1CON2bits.PVCFG = 0x00 ;
    AD1CON2bits.NVCFG0 = 0x0 ; 
    AD1CON3bits.ADCS = 0xFF ;
    AD1CON1bits.SSRC = 0x0 ;
    AD1CON3bits.SAMC = 0b10000 ;
    AD1CON1bits.FORM = 0b00 ;
    AD1CON2bits.SMPI = 0x0 ;
    AD1CON1bits.MODE12 = 0 ;
    AD1CON1bits.ADON = 1 ;
    
    //RED GREEN BLUE TRIS
    TRISAbits.TRISA0=OUTPUT;
    TRISAbits.TRISA1=OUTPUT;
    TRISCbits.TRISC7=OUTPUT;
    _RP26R = 13; 
    _RP27R = 14;
    _RP23R = 15;   
    OC1RS = 0;
    OC1CON2bits.SYNCSEL = 0x1F; 
    OC1CON2bits.OCTRIG = 0; 
    OC1CON1bits.OCTSEL = 0b111;
    OC1CON1bits.OCM = 0b110; 
    OC1CON2bits.TRIGSTAT = 1;
    OC2RS = 0;                   
    OC2CON2bits.SYNCSEL = 0x1F;     
    OC2CON2bits.OCTRIG = 0;        
    OC2CON1bits.OCTSEL = 0b111;     
    OC2CON1bits.OCM = 0b110;       
    OC2CON2bits.TRIGSTAT = 1;
    OC3RS = 0;                  
    OC3CON2bits.SYNCSEL = 0x1F;     
    OC3CON2bits.OCTRIG = 0;        
    OC3CON1bits.OCTSEL = 0b111;     
    OC3CON1bits.OCM = 0b110;        
    OC3CON2bits.TRIGSTAT = 1;  
    OC1R=0;
    OC2R=0;
    OC3R=0;
}

//init fot interrupts
void init(){
    //enable s1 and s2 interrupts
    PADCON = 0x8000;
    IOCSTAT = 1;
    IOCPAbits.IOCPA11 = 1;
    IOCPAbits.IOCPA12 = 1;
    IFS1bits.IOCIF = 0;
    IEC1bits.IOCIE = 1;
}

//struct for each shape
typedef struct{
    int id;
    uint16_t color;
    char **array;
    int width, row, col;
} Shape;
//uint16_t shapes_colors[7]={OLEDC_COLOR_CORAL , OLEDC_COLOR_BLUE , OLEDC_COLOR_GREEN , OLEDC_COLOR_PINK , OLEDC_COLOR_BROWN , OLEDC_COLOR_PURPLE , OLEDC_COLOR_DARKRED};
uint16_t shapes_colors[8]={0,0xfbea , 0x1f , 0x400 , 0xfe19 , 0xa145 , 0x8010 , 0x8800};
int colors_red[8]=  {0,255 , 0   , 0   , 255 , 165 , 128 , 139};
int colors_green[8]={0,127 , 0   , 128 , 192 , 42 , 0   , 0  };
int colors_blue[8]= {0,80  , 255 , 0   , 203 , 42 , 128 , 0  };

//array of shapes to copy from
const Shape ShapesArray[7] = {
    {1,0xfbea,(char *[]){(char []){0,0,1,1,1,1},(char []){0,0,1,1,1,1},(char []){1,1,1,1,0,0},(char []){1,1,1,1,0,0}, (char []){0,0,0,0,0,0},(char []){0,0,0,0,0,0}}, 6}, //S_shape     
    {2,0x1f  ,(char *[]){(char []){1,1,1,1,0,0},(char []){1,1,1,1,0,0},(char []){0,0,1,1,1,1},(char []){0,0,1,1,1,1}, (char []){0,0,0,0,0,0},(char []){0,0,0,0,0,0}}, 6}, //Z_shape     
    {3,0x400 ,(char *[]){(char []){0,0,1,1,0,0},(char []){0,0,1,1,0,0},(char []){1,1,1,1,1,1},(char []){1,1,1,1,1,1}, (char []){0,0,0,0,0,0},(char []){0,0,0,0,0,0}}, 6}, //T_shape     
    {4,0xfe19,(char *[]){(char []){0,0,0,0,1,1},(char []){0,0,0,0,1,1},(char []){1,1,1,1,1,1},(char []){1,1,1,1,1,1}, (char []){0,0,0,0,0,0},(char []){0,0,0,0,0,0}}, 6}, //L_shape     
    {5,0xa145,(char *[]){(char []){1,1,0,0,0,0},(char []){1,1,0,0,0,0},(char []){1,1,1,1,1,1},(char []){1,1,1,1,1,1}, (char []){0,0,0,0,0,0},(char []){0,0,0,0,0,0}}, 6}, //ML_shape    
    {6,0x8010,(char *[]){(char []){1,1,1,1},(char []){1,1,1,1},(char []){1,1,1,1},(char []){1,1,1,1}}, 4},                                                   //SQ_shape
    {7,0x8800,(char *[]){(char []){0,0,0,0,0,0,0,0},(char []){0,0,0,0,0,0,0,0}, (char []){1,1,1,1,1,1,1,1},(char []){1,1,1,1,1,1,1,1}, (char []){0,0,0,0,0,0,0,0},(char []){0,0,0,0,0,0,0,0}, (char []){0,0,0,0,0,0,0,0},(char []){0,0,0,0,0,0,0,0}}, 8} //R_shape
};

//var for the game
char Table[ROWS][COLS] = {0};
char GameOn = TRUE;
Shape curr_shape;
Shape next;

//return copy of the shape
Shape CopyShape(Shape shape){
    Shape new_shape;
    memcpy(&new_shape, &shape, sizeof(Shape));
    memcpy(&new_shape.array[0][0], &shape.array[0][0],sizeof(shape.array));
    int i,j;
    new_shape.width = shape.width;
    for(i = 0; i < new_shape.width ;i++){
		for(j = 0; j <  new_shape.width ; j++){
				new_shape.array[i][j] = shape.array[i][j];
		}
	}
    return new_shape;
}

//select new shape and copy it to the curr shape
void SetNewRandomShape(){ //updates [current] with new shape
//    int random_shape = rand()%7;
    Shape new_shape = CopyShape(ShapesArray[rand()%7]);
    new_shape.col=2;//
    new_shape.row=0;//     
    DeleteShape(curr_shape);
    curr_shape = new_shape;
	if(!CheckPosition(curr_shape)){
		GameOn = FALSE;
	}
}

//delete shape
void DeleteShape(Shape shape){
    int i;
    for(i = 0; i < shape.width; i++){
        free(shape.array[i]);
    }
    free(shape.array);
}

//addind the curr shape to the table
void addToTable(){
	int i, j;
	for(i = 0; i < curr_shape.width ;i++){
		for(j = 0; j <  curr_shape.width ; j++){
			if(curr_shape.array[i][j]){
				Table[curr_shape.row+i][curr_shape.col+j] = curr_shape.id;
            }
		}
	}
}


//Rotate right
void rotate90Clockwise(Shape shape)
{
    int width = shape.width;
    int i,j,temp;
    // Traverse each cycle
    for (i = 0; i < width/ 2; i++) {
        for (j = i; j < width - i - 1; j++) {
            temp = shape.array[i][j];
            shape.array[i][j] = shape.array[width - 1 - j][i];
            shape.array[width - 1 - j][i] = shape.array[width - 1 - i][width - 1 - j];
            shape.array[width - 1 - i][width - 1 - j] = shape.array[j][width - 1 - i];
            shape.array[j][width - 1 - i] = temp;
        }
    }
}

//Rotate left
void rotateAnti90Clockwise(Shape shape)
{       
    int N = shape.width;
    int i,j;
    Shape s = CopyShape(curr_shape);
    for(i=0;i<N;i++){
        for(j=i;j<N;j++){
            char t= shape.array[i][j];
            shape.array[i][j] = shape.array[j][i];
            shape.array[j][i] = t;
        }
    }
    
    int c=0;
    while(c<N){
        i=0;
        j=N-1;
        while(i<j){
           char t= shape.array[i][c];
           shape.array[i][c] = shape.array[j][c];
           shape.array[j][c] = t; 
           i++;
           j--;
        }
        c++;
    }
}



//chack if the move are allowed
int CheckPosition(Shape shape){ //Check the position of the copied shape
	char **array = shape.array;
	int i, j;
	for(i = 0; i <  shape.width;i++) {
		for(j = 0; j < shape.width ;j++){
			if((shape.col+j < 0 || shape.col+j >= COLS || shape.row+i >= ROWS)){ //Out of borders/////
				if(array[i][j]) //but is it just a phantom?
					return FALSE;
				
			}
			else if(Table[shape.row+i][shape.col+j] && array[i][j])
				return FALSE;
		}
	}
	return TRUE;
}


//print all the table
void PrintTable(){
    int i,j;
    for ( i = 0; i < ROWS ; i++ ){
    //width must be known (see below)
		for(j=0; j < COLS; j++) {
            if(Table[i][j]){
                oledC_DrawPoint(j,i,shapes_colors[Table[i][j]]);//to change
            }
		}
    }
}

//print curr shape
void PrintCurrShape(){
    int i,j;
    for ( i = 0; i < curr_shape.width ; i++ ){
		for(j=0; j < curr_shape.width; j++) {
            if(curr_shape.array[i][j]){
                oledC_DrawPoint(curr_shape.col+j,curr_shape.row+i,curr_shape.color);
            }
		}
    }
}

//chack if line are full
void chackAllLines(){ //checks lines
    int i, j, sum;
    for(i=0;i<ROWS;i++){
        sum = 0;
        for(j=0;j< COLS;j++) {
             if(Table[i][j]){
                sum++;
             }
        }
        if(sum==COLS){
            //delete row i
            
            int l, k;
            for(k = i;k >=1;k--)
                for(l=0;l<COLS;l++)
                    Table[k][l]=Table[k-1][l];
            for(l=0;l<COLS;l++)
                Table[k][l]=0;
                //drow
                oledC_DrawPoint(k,l,OLEDC_COLOR_SKYBLUE);
            
        }
    }
}


//display colors
void colorled(int r, int g, int b){
    OC1R=r;
    OC2R=g;
    OC3R=b;
}

//all actions are here
void ManipulateCurrent(int action){
    Shape temp = CopyShape(curr_shape);
    switch(action){
        //Down
        case 1:
            temp.row++;  //move down
            if(CheckPosition(temp))
                curr_shape.row++;
            else {
                addToTable();
                chackAllLines(); //check full lines, after putting it down
                DeleteShape(curr_shape);
                curr_shape = next;
                curr_shape.col=2;//
                curr_shape.row=0;//
                next = CopyShape(ShapesArray[rand()%7]);    
                if(!CheckPosition(curr_shape)){
                    GameOn = FALSE;
                }
                //show led of next shape
                int next_id;
                next_id = next.id;
                colorled(colors_red[next_id],colors_green[next_id],colors_blue[next_id]);
            }
            break;
        //Go right
        case 2:
            temp.col++; 
            if(CheckPosition(temp))
                curr_shape.col++;
            break;
        //Go left
        case 3:
            temp.col--;  
            if(CheckPosition(temp))
                curr_shape.col--;
            break;
        //Rotate
        case 4:
            rotateAnti90Clockwise(curr_shape);
            break;
        case 5:
            rotate90Clockwise(curr_shape);
            break;
    }
    DeleteShape(temp);
    PrintTable();
}


//get potentiometer value
unsigned int potentiometer(){//THE LABC1 WE MADE IN THE CLASS
    int i ;
    AD1CHS = 8 ;//CHANEL
    AD1CON1bits.SAMP = 1 ;        
    for (i = 0 ; i < 1000 ; i++) ; 
    AD1CON1bits.SAMP = 0 ;           
    for (i = 0 ; i < 1000 ; i++) ; 
    while (!AD1CON1bits.DONE) ;       
    return ADC1BUF0 ;//RESULT
}



//start the game over
void startOver(){
    oledC_clearScreen();
    timer = 100;
    GameOn = TRUE;
    //set curr shape
    SetNewRandomShape();
    //set next shape and show led
    next = CopyShape(ShapesArray[rand()%7]);
    int next_id;
    next_id = next.id;
    colorled(colors_red[next_id],colors_green[next_id],colors_blue[next_id]);
    //clear screen
    int i,j;
    for(i = 0; i < ROWS ;i++){
		for(j = 0; j <  COLS ; j++){
				Table[i][j]=0;
		}
	}
}


//Timer interrupt
void __attribute__((interrupt))_T1Interrupt(void)
{
    if (GameOn) {
        //go dowm
        ManipulateCurrent(1);
        oledC_clearScreen();
        PrintCurrShape();
    }else{
        //game over!
        oledC_clearScreen();
        oledC_DrawString(20, 1, 50, 20, (uint8_t *)&"TRY AGAIN", 0x0);
        startOver();
    }
    int p_value;
    p_value = potentiometer();
//    p_value = p_value /1022;
    if(p_value == 0){
        //go right
        ManipulateCurrent(2);
    }else if(p_value >= 1020){
        //go left
        ManipulateCurrent(3);
    }  
}

//Input and Output interrupt
void __attribute__((interrupt)) _IOCInterrupt(void)
{
    //both are pressed- next level 
    if (IOCFAbits.IOCFA11 == 1 && IOCFAbits.IOCFA12 == 1){
        //two leds on
        LATAbits.LATA8=1;
        LATAbits.LATA9=1;
        //increase speed of timer
        if (timer < 1000000000){
            timer = timer*10;
            PR1 = timer;
        }
        //ntn off
        IOCFAbits.IOCFA11 = 0;
        IOCFAbits.IOCFA12 = 0;
        //two leds off
        LATAbits.LATA8=0;
        LATAbits.LATA9=0;
    }
    if (IOCFAbits.IOCFA11 == 1 && IOCFAbits.IOCFA12 == 0){
        //led on
        LATAbits.LATA8=1;
        //rotate left
        ManipulateCurrent(4);
//        //initialize back
        IOCFAbits.IOCFA11 = 0;
        LATAbits.LATA8=0;

    }
    //if s2 is pressed
    else if (IOCFAbits.IOCFA12 == 1 && IOCFAbits.IOCFA11 == 0)
    {
        //led on
        LATAbits.LATA9=1;   
        //rotate rigth
        ManipulateCurrent(5);
        //initialize back
        IOCFAbits.IOCFA12 = 0;
        LATAbits.LATA9=0;

    }
    IFS1bits.IOCIF = 0;
}



int main(void)
{   
    init_system();
    init();
    //Main loop
    oledC_DrawString(35, 50, 1, 1, (uint8_t *)&"GAME START", 0x0);

    oledC_clearScreen();
    SetNewRandomShape();
    next = CopyShape(ShapesArray[rand()%7]);
    int next_id;
    next_id = next.id;
    colorled(colors_red[next_id],colors_green[next_id],colors_blue[next_id]);
    while(1){}
    return 1;
}

