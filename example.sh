#!/bin/bash

#
# Test the JMeter Docker image using a trivial test plan.
# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# 

export THREADS="50"
export RAMPUP="50"
export DURATION="240"
export SCRIPT="test/JMeter_Docker_Script_Plugins.jmx"
export JTL="test/JMeter_Docker_Script_Plugins.jtl"
export LOG="test/JMeter_Docker_Script_Plugins.log"

rm -f ${JTL} ${LOG}

./run.sh \
	-n -t ${SCRIPT} \
	-l ${JTL} \
	-j ${LOG} \
	-Jthreads=${THREADS} \
	-Jrampup=${RAMPUP} \
	-Jduration=${DURATION}