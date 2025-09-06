FROM tomcat:11.0.10-jdk17

# Xoá ứng dụng mặc định của Tomcat (tuỳ chọn)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào Tomcat
COPY EmailList.war /usr/local/tomcat/webapps/ROOT.war

# Mở port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
