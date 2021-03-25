FROM centos

MAINTAINER rns@rnstech.com

RUN yum update -y
RUN yum -y install java
RUN java -version

#RUN mkdir /opt/tomcat/

WORKDIR /opt
RUN curl -O http://us.mirrors.quenda.co/apache/tomcat/tomcat-8/v8.5.42/bin/apache-tomcat-8.5.42.tar.gz
RUN tar xzvf apache-tomcat-8.5.42.tar.gz -C /opt/
RUN cp -R /opt/apache-tomcat-8.5.42/ /opt/tomcat

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/venkat09docs/Resources/raw/master/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
