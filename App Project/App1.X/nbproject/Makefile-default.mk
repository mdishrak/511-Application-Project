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
FINAL_IMAGE=${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=main.c ADC.c Display.c TimeDelay.c UARTs.c NewClk.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/ADC.o ${OBJECTDIR}/Display.o ${OBJECTDIR}/TimeDelay.o ${OBJECTDIR}/UARTs.o ${OBJECTDIR}/NewClk.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/ADC.o.d ${OBJECTDIR}/Display.o.d ${OBJECTDIR}/TimeDelay.o.d ${OBJECTDIR}/UARTs.o.d ${OBJECTDIR}/NewClk.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/ADC.o ${OBJECTDIR}/Display.o ${OBJECTDIR}/TimeDelay.o ${OBJECTDIR}/UARTs.o ${OBJECTDIR}/NewClk.o

# Source Files
SOURCEFILES=main.c ADC.c Display.c TimeDelay.c UARTs.c NewClk.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24F16KA101
MP_LINKER_FILE_OPTION=,--script=p24F16KA101.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/19578cd4a6876cfac2c731ccf3485c60113862c5 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC.o: ADC.c  .generated_files/flags/default/5d2b42d97f994d72567d0d30d1fd581750a79650 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC.c  -o ${OBJECTDIR}/ADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Display.o: Display.c  .generated_files/flags/default/6bc1cf517fa744d4178de5f57dcdb00918c2482 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Display.o.d 
	@${RM} ${OBJECTDIR}/Display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Display.c  -o ${OBJECTDIR}/Display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Display.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TimeDelay.o: TimeDelay.c  .generated_files/flags/default/41a7d5270d638edfc44cdf41148fe4cc018164b8 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/TimeDelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TimeDelay.c  -o ${OBJECTDIR}/TimeDelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TimeDelay.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/UARTs.o: UARTs.c  .generated_files/flags/default/34833b09c8c408b282ce16dff75742a85c9ce75c .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UARTs.o.d 
	@${RM} ${OBJECTDIR}/UARTs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  UARTs.c  -o ${OBJECTDIR}/UARTs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/UARTs.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/NewClk.o: NewClk.c  .generated_files/flags/default/9458146ead897ba861cfb7b0e36bad593df9f4f .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NewClk.o.d 
	@${RM} ${OBJECTDIR}/NewClk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  NewClk.c  -o ${OBJECTDIR}/NewClk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/NewClk.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/def8222837fff015c164a7201c1c0e1279e6a917 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC.o: ADC.c  .generated_files/flags/default/67af2b3435857511bb5d8a442f0e45b54f2bd5a4 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC.o.d 
	@${RM} ${OBJECTDIR}/ADC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ADC.c  -o ${OBJECTDIR}/ADC.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/Display.o: Display.c  .generated_files/flags/default/73cf7224d4ff1d9589f3fc938f027a6f2d226c19 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Display.o.d 
	@${RM} ${OBJECTDIR}/Display.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  Display.c  -o ${OBJECTDIR}/Display.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/Display.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TimeDelay.o: TimeDelay.c  .generated_files/flags/default/e120e8621312f7495ecd5f46d268ddf9cdc66516 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/TimeDelay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TimeDelay.c  -o ${OBJECTDIR}/TimeDelay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TimeDelay.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/UARTs.o: UARTs.c  .generated_files/flags/default/b4fe2997b8a9f171f2627cb92499aa8ddf316733 .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UARTs.o.d 
	@${RM} ${OBJECTDIR}/UARTs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  UARTs.c  -o ${OBJECTDIR}/UARTs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/UARTs.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/NewClk.o: NewClk.c  .generated_files/flags/default/534b770c85b6fd107204256540f4573b9ff360a .generated_files/flags/default/143812f4bc22701358e3bd70c3b4d36ec53e2745
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/NewClk.o.d 
	@${RM} ${OBJECTDIR}/NewClk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  NewClk.c  -o ${OBJECTDIR}/NewClk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/NewClk.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/App1.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/App1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/App1.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
