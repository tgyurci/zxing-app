FROM gradle:6.6.0-jre AS zxing-app-build

COPY . /zxing-app
WORKDIR /zxing-app
RUN gradle --no-daemon --info build


FROM openjdk:11.0.8-jre-slim AS zxing-app

COPY --from=zxing-app-build --chown=root \
		/zxing-app/build/libs/zxing-app-3.4.0-all.jar \
		/zxing-app.jar

COPY ./zxing-app.sh /zxing-app.sh
CMD ["/zxing-app.sh"]
