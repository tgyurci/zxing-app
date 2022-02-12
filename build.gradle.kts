plugins {
    application
    id("com.github.johnrengelman.shadow") version "7.1.2"
}

repositories {
    mavenCentral()
}

val zxingVersion = "3.4.1"
val revision = "0"
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

    wrapper {
        gradleVersion = "7.4"
        distributionType = Wrapper.DistributionType.ALL
    }
}
