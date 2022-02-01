FROM gradle:7.3-jdk17 as builder
ARG APP_HOME=/project
WORKDIR $APP_HOME
COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
COPY --chown=gradle:gradle src $APP_HOME/src

RUN gradle --no-daemon build

ENTRYPOINT java -jar /project/build/libs/runnable.jar
