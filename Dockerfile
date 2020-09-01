FROM gradle:6.6.1-jre AS zxing-app-build

COPY . /zxing-app-build
WORKDIR /zxing-app-build
RUN gradle --no-daemon --info build


FROM openjdk:11.0.8-jre-slim AS zxing-app

COPY --from=zxing-app-build --chown=root /zxing-app-build/build/libs/zxing-app-3.4.0-all.jar /

ENTRYPOINT [ "java", "-jar", "/zxing-app-3.4.0-all.jar" ]
