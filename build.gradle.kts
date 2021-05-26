plugins {
    application
    id("com.github.johnrengelman.shadow") version "7.0.0"
}

repositories {
    mavenCentral()
}

val zxingVersion = "3.4.0"
val revision = "1"
version = "${zxingVersion}_${revision}"

application {
    mainClass.set("com.google.zxing.client.j2se.CommandLineRunner")
}

dependencies {
    implementation("com.google.zxing:javase:$zxingVersion")
}

tasks {
    shadowJar {
        isPreserveFileTimestamps = false
        isReproducibleFileOrder = true
    }
}
