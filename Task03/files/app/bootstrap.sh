#!/bin/sh
#https://stackoverflow.com/questions/34549859/run-a-script-in-dockerfile



apt update

apt install openjdk-17-jdk -y

#add-apt-repository ppa:linuxuprising/java
#apt update

java -version