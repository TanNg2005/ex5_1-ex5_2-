# Sử dụng Tomcat 11.0.10 với JDK 17
FROM tomcat:11.0.10-jdk17-openjdk-slim

# Thông tin metadata
LABEL maintainer="your-email@example.com"
LABEL description="Email List Servlet Application"

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Set environment variables
ENV CATALINA_HOME=/usr/local/tomcat
ENV JAVA_OPTS="-Djava.awt.headless=true -Xmx512m -XX:+UseG1GC"

# Tạo thư mục cho ứng dụng
WORKDIR /usr/local/tomcat/webapps

# Copy file WAR từ target directory
COPY target/*.war ROOT.war

# Set permissions
RUN chmod -R 755 /usr/local/tomcat/webapps/
RUN chown -R root:root /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/index.html || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]