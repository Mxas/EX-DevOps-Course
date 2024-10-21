#FROM openjdk:17-oracle
#
#COPY files/app/app-v1.jar libs/api.jar
#
#ENTRYPOINT ["java","-jar","/libs/api.jar"]


FROM ubuntu

COPY "03 Task/files/app/app-v1.jar" libs/api.jar
COPY "03 Task/files/app/bootstrap.sh" bootstrap.sh

RUN chmod +x /bootstrap.sh

RUN /bootstrap.sh

ENTRYPOINT ["java","-jar","/libs/api.jar"]