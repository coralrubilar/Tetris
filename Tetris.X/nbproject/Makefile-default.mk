#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=oledDriver/oledC.c oledDriver/oledC_shapes.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c Tetris.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/Tetris.o
POSSIBLE_DEPFILES=${OBJECTDIR}/oledDriver/oledC.o.d ${OBJECTDIR}/oledDriver/oledC_shapes.o.d ${OBJECTDIR}/spiDriver/spi1_driver.o.d ${OBJECTDIR}/System/clock.o.d ${OBJECTDIR}/System/delay.o.d ${OBJECTDIR}/System/system.o.d ${OBJECTDIR}/Tetris.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/oledDriver/oledC.o ${OBJECTDIR}/oledDriver/oledC_shapes.o ${OBJECTDIR}/spiDriver/spi1_driver.o ${OBJECTDIR}/System/clock.o ${OBJECTDIR}/System/delay.o ${OBJECTDIR}/System/system.o ${OBJECTDIR}/Tetris.o

# Source Files
SOURCEFILES=oledDriver/oledC.c oledDriver/oledC_shapes.c spiDriver/spi1_driver.c System/clock.c System/delay.c System/system.c Tetris.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ256GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/8a6c935dc80d47f1fb172b05e84e659388c6784f .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/27d416a647abfd24f266b35a54600c098c37b99d .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/c08f234db0b7713cb808e09b135305b0c730d467 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/8719e964feaf96b143e27be25abe7d61e0041ed6 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/793ca5401ed2a9e2ddc90ff30396b744b3db2781 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/1455e062662eb773e404133db2e52c3ec2086428 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Tetris.o: Tetris.c  .generated_files/flags/default/e2ff13ec609e8398834b5224602f05a300e7acdd .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tetris.o.d 
	@${RM} ${OBJECTDIR}/Tetris.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Tetris.c  -o ${OBJECTDIR}/Tetris.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Tetris.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/oledDriver/oledC.o: oledDriver/oledC.c  .generated_files/flags/default/87bd33ceacd4ffa5aa1e2d6bc0e83441f758d9fb .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC.c  -o ${OBJECTDIR}/oledDriver/oledC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/oledDriver/oledC_shapes.o: oledDriver/oledC_shapes.c  .generated_files/flags/default/5dda74d7ee6268b285dd7fd1a3da9077cabe5033 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/oledDriver" 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o.d 
	@${RM} ${OBJECTDIR}/oledDriver/oledC_shapes.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  oledDriver/oledC_shapes.c  -o ${OBJECTDIR}/oledDriver/oledC_shapes.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/oledDriver/oledC_shapes.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/spiDriver/spi1_driver.o: spiDriver/spi1_driver.c  .generated_files/flags/default/a8f95680d0c46d1b189a1aed0fe6b2cde186584b .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/spiDriver" 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/spiDriver/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  spiDriver/spi1_driver.c  -o ${OBJECTDIR}/spiDriver/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/spiDriver/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/clock.o: System/clock.c  .generated_files/flags/default/a7358eb06adc6c42c67bf1a4a872bd1823200936 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/clock.o.d 
	@${RM} ${OBJECTDIR}/System/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/clock.c  -o ${OBJECTDIR}/System/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/delay.o: System/delay.c  .generated_files/flags/default/173fc320f05066138e774d6986f0e86e6ad1174f .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/delay.o.d 
	@${RM} ${OBJECTDIR}/System/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/delay.c  -o ${OBJECTDIR}/System/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/System/system.o: System/system.c  .generated_files/flags/default/aee2eee125f8cab49e190f8a8bf6b449fc321c85 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/System" 
	@${RM} ${OBJECTDIR}/System/system.o.d 
	@${RM} ${OBJECTDIR}/System/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  System/system.c  -o ${OBJECTDIR}/System/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/System/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Tetris.o: Tetris.c  .generated_files/flags/default/54552a98c16948393cca965905a2a30e78d6b0f5 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Tetris.o.d 
	@${RM} ${OBJECTDIR}/Tetris.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Tetris.c  -o ${OBJECTDIR}/Tetris.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Tetris.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -I"bsp" -DFCY=4000000 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Tetris.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
