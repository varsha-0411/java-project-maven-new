# ---------- Stage 1: Artifact Stage ----------
FROM alpine:3.19 AS artifact

WORKDIR /app

# Copy WAR file from Jenkins workspace
COPY target/myapp.war myapp.war


# ---------- Stage 2: Runtime Stage ----------
FROM tomcat:9.0-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR from artifact stage
COPY --from=artifact /app/myapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh","run"]
