#!/bin/bash


pcs resource create p_tomcat tomcat java_home="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-1.el7.x86_64/jre/" catalina_home="/apache-tomcat-8.5.82" op monitor timeout="30s" interval="10s"
