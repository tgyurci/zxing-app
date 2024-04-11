plugins {
    application
    id("com.github.johnrengelman.shadow") version "8.1.1"
}

repositories {
    mavenCentral()
}

val zxingVersion = "3.5.3"
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
        gradleVersion = "8.7"
        distributionType = Wrapper.DistributionType.ALL
    }
}
