FROM almalinux

RUN  yum update -y &&  yum install java-11-openjdk -y &&  yum install git -y &&  yum install maven -y

RUN git clone https://github.com/rohanchau1111/java2.git
WORKDIR $PWD/java2

RUN mvn clean

RUN mvn test -X

RUN mvn package
EXPOSE 80
CMD ["mvn" , "tomcat7:run"]