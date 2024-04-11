FROM amazoncorretto:21-alpine AS zxing-app-build

COPY . /zxing-app-build
WORKDIR /zxing-app-build
RUN ./gradlew --no-daemon --console=plain --info clean build


FROM amazoncorretto:21-alpine AS zxing-app

COPY --from=zxing-app-build --chown=root /zxing-app-build/build/libs/zxing-app-3.5.3_0-all.jar /

ENTRYPOINT [ "java", "-jar", "/zxing-app-3.5.3_0-all.jar" ]
