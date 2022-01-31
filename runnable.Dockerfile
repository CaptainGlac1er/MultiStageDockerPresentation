FROM openjdk:17-slim
ARG APP_HOME=/project
COPY --from=builder $APP_HOME/build/libs/runnable.jar app.jar

ENTRYPOINT java -jar app.jar
