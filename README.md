# zxing-app

This is a Gradle build script for creating a runnable jar for the [ZXing][]
library.

## Usage

```sh
docker run --rm -i tgyurci/zxing-app QR_code.png
```

Decode an image without mounting host volume to th econtainer:

```sh
docker run --rm -i tgyurci/zxing-app /dev/stdin < QR_code.png
```

[ZXing]: https://github.com/zxing/zxing
