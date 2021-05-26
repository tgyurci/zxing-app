FROM gradle:7.0.2-jre AS zxing-app-build

COPY . /zxing-app-build
WORKDIR /zxing-app-build
RUN gradle --no-daemon --info build


FROM openjdk:11.0.11-jre-slim AS zxing-app

COPY --from=zxing-app-build --chown=root /zxing-app-build/build/libs/zxing-app-3.4.0_1-all.jar /

ENTRYPOINT [ "java", "-jar", "/zxing-app-3.4.0_1-all.jar" ]
