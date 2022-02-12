FROM openjdk:11.0.14 AS zxing-app-build

COPY . /zxing-app-build
WORKDIR /zxing-app-build
RUN ./gradlew --no-daemon --console=plain --info clean build


FROM openjdk:11.0.14-jre-slim AS zxing-app

COPY --from=zxing-app-build --chown=root /zxing-app-build/build/libs/zxing-app-3.4.1_0-all.jar /

ENTRYPOINT [ "java", "-jar", "/zxing-app-3.4.1_0-all.jar" ]
