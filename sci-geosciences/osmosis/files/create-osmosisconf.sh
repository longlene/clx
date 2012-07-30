#!/bin/bash

cat << EOF
main is org.openstreetmap.osmosis.core.Osmosis from osmosis.core

[osmosis.core]
EOF

echo -e "load $(java-config --classpath jpf-1.5 | sed 's/:/\n/g' | grep jpf\.jar)
load $(java-config --classpath commons-logging | sed 's/:/\n/g' | grep commons-logging\.jar)
load $(java-config --classpath classworlds-1)
load $(java-config --classpath aopalliance-1)
load $(java-config --classpath commons-codec)
load $(java-config --classpath osmosis)"

echo "load /opt/osmosis/osmosis-0.35.1/lib/default/commons-compress-1.0.jar"
