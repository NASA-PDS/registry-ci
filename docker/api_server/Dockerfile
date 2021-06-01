FROM openjdk:11-slim

# -------------------------------------------------------------
# Copy configuration
# -------------------------------------------------------------

COPY cfg /cfg

# -------------------------------------------------------------
# Entry point
# -------------------------------------------------------------

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/local/bin/entrypoint.sh"]
