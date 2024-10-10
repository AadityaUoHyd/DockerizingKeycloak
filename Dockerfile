# Use the official Keycloak image
FROM quay.io/keycloak/keycloak:latest

# Set environment variables for Keycloak
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin@123
ENV KC_HTTPS_PORT=9080

# Expose the HTTPS port
EXPOSE 9080

# Copy the keystore into the Keycloak container
COPY keycloak.jks /opt/keycloak/keycloak.jks

# Set the SSL keystore location and password
ENV KC_HTTPS_KEYSTORE=/opt/keycloak/keycloak.jks
ENV KC_HTTPS_KEYSTORE_PASSWORD=Password#123

# Run Keycloak in production mode with HTTPS
ENTRYPOINT ["kc.sh", "start", "--https-port=9080", "--http-address=0.0.0.0", "--optimized"]
