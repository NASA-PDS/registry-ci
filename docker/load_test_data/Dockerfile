FROM openjdk:11-slim

# -------------------------------------------------------------
# Copy test data
# -------------------------------------------------------------

COPY cfg /cfg
COPY data /data
COPY postman /postman

# -------------------------------------------------------------
# Entry point
# -------------------------------------------------------------

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
