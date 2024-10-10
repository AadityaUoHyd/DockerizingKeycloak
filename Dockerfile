RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname “CN=server” -alias server -ext “SAN:c=DNS:localhost,IP:0.0.0.0” -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build
FROM Quay 5
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin@123
ENTRYPOINT [“/opt/keycloak/bin/kc.sh”]
CMD [“start”,“–optimized”]
