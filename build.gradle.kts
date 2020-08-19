plugins {
    application
    id("com.github.johnrengelman.shadow") version "6.0.0"
}

repositories {
    mavenCentral()
}

version = "3.4.0"

application {
    mainClassName = "com.google.zxing.client.j2se.CommandLineRunner"
}

dependencies {
    implementation("com.google.zxing:javase:$version")
}
