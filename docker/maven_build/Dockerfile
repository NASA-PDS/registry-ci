FROM maven:3.8-jdk-11-slim

# -------------------------------------------------------------
# Cache maven dependency jars
# -------------------------------------------------------------

WORKDIR /tmp

# Harvest jars
ADD pom/harvest/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# Regestry Manager jars
ADD pom/manager/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# Extra jars for Harvest and Registry Manager (maven-surefire-plugin, junit, etc.)
ADD pom/extra_harvest/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# Registry API
ADD pom/api/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# Extra jars for Registry API (maven-surefire-plugin, junit, etc.)
ADD pom/extra_api/pom.xml /tmp/
RUN mvn verify --fail-never && mvn clean && rm -rf /tmp/pom.xml

# -------------------------------------------------------------
# Add extra apps (git)
# -------------------------------------------------------------

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# -------------------------------------------------------------
# Entry point
# -------------------------------------------------------------

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
