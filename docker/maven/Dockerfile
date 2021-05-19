FROM maven:3.8-jdk-11-slim

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Cache maven dependency jars
WORKDIR /tmp

# Harvest jars
ADD pom/harvest/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# Regestry Manager jars
ADD pom/manager/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml
