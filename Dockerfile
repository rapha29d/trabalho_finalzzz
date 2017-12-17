# Version: 0.0.1
FROM anapsix/alpine-java:8_server-jre_unlimited
MAINTAINER Raphael Paes Alves "raphapaes_al@hotmail.com"
ENV REFRESHED_AT 2017-10-09

# Prepare environment 
ENV TOMCAT_MAJOR=8
ENV TOMCAT_VERSION=8.5.23
ENV CATALINA_HOME=/opt/tomcat
ENV TOMCAT_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

# Add openssl for https download
RUN apk add --update openssl
RUN rm -rf /var/cache/apk/* /tmp/*

# Install Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN rm apache-tomcat*.tar.gz
RUN mv apache-tomcat* ${CATALINA_HOME}
RUN chmod +x ${CATALINA_HOME}/bin/*.sh

# Create Tomcat admin user
COPY tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml
RUN chmod 600 ${CATALINA_HOME}/conf/tomcat-users.xml
COPY web.xml $CATALINA_HOME/webapps/manager/WEB-INF/web.xml
RUN chmod 600 ${CATALINA_HOME}/webapps/manager/WEB-INF/web.xml

#Permite o acesso de outro servidor ao gerenciador do Tomcat
COPY context.xml $CATALINA_HOME/webapps/manager/META-INF/context.xml
COPY target/aplicacao-1.0-SNAPSHOT.war /opt/tomcat/webapps/aplicacao.war

EXPOSE 8080
EXPOSE 8009

CMD ["catalina.sh", "run"]
