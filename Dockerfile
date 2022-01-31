FROM gradle:7.3-jdk17 as builder
ARG APP_HOME=/project
WORKDIR $APP_HOME
COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
COPY --chown=gradle:gradle src $APP_HOME/src

RUN gradle --no-daemon build

FROM openjdk:17-slim
ARG APP_HOME=/project
COPY --from=builder $APP_HOME/build/libs/runnable.jar app.jar

ENTRYPOINT java -jar app.jar
