#!/usr/bin/env bash

# set up env vars
export _JAVA_OPTIONS="-D-MY_KEY_1=DEFAULT"
export JAVA_TOOL_OPTIONS="-D-MY_KEY_2=DEFAULT"
export JDK_JAVA_OPTIONS="-D-MY_KEY_3=DEFAULT"

# compile project
printf "Compiling... \n"
javac -d ./target src/de/d3ns0n/Main.java && printf "\n"

# run project
JAVA_OPTS="-D-MY_KEY_1=OVERRIDDEN -D-MY_KEY_2=OVERRIDDEN -D-MY_KEY_3=OVERRIDDEN"
printf "Starting java app with: JAVA_OPTS=\"%s\" \n" "${JAVA_OPTS}"
java $JAVA_OPTS -classpath ./target de.d3ns0n.Main
