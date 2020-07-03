# Centos based container with Java and Tomcat
FROM centos:latest

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar && \
 yum -y install sudo

#ENV CATALINA_HOME /opt/tomcat 
#ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

#Open-jdk
#RUN yum install -y \
   #java-1.8.0-openjdk \
   #java-1.8.0-openjdk-devel

#ENV JAVA_HOME /opt/java-1.8.0-openjdk/


#Tomcat
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
ADD apache-tomcat-8.5.56.tar.gz /opt/tomcat
#RUN tar xvfz apache*.tar.gz
RUN mv  apache-tomcat-8.5.56/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
#RUN echo "JAVA_HOME=/opt/java-1.8.0-openjdk/" >> /etc/default/tomcat8
#RUN groupadd tomcat
#RUN useradd -s /bin/bash -g tomcat tomcat
#RUN chown -Rf tomcat.tomcat /opt/tomcat/tomcat8



WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/beardbytes/JavaCRUDRestWS/tree/master/dist/MyWebsite.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

