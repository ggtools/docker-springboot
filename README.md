# Docker for Spring Boot

A Docker image to create [Spring Boot](http://projects.spring.io/spring-boot/) based containers in a jiffy.

Although running Spring Boot executable jars under Docker is quite straightforward this image provides with some nice features:

- Run from a light Java 8 image
- Use a normal user instead of `root`
- Use `/dev/urandom` instead of `/dev/random` to fix startup issues
- Add the executable jar as well as any configuration

## Simple Image

Creating a derived image is a two step process:

- Create a `Dockerfile`
- Put the application

### Dockerfile

Create a minimal `Dockerfile` for instance:

    FROM ggtools/spring-boot
    MAINTAINER Your Name <your@ema.il>

### Spring Boot Application directory

The base `Dockerfile` expects the executable jar to be named `spring-boot-app.jar` and to be located under the `spring-boot-app/lib` directory. The second step would be to create the directory and copy the executable jar into it.

## Configuration

In addition to the jar the image will also include any file located under the `spring-boot-app/config` directory. According to Spring Boot documentation on [Externalized Configuration](http://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html) the configuration files located in this directory will take precedence over the configuration files in the application jar.

## Customization

The default behavior can be customized using environment variables:

- `SB_APP_JAR` to change the name of the application jar (default `spring-boot-app.jar`)
- `SB_ACTIVE_PROFILES` to select the active profiles (default `docker`)

## License

The image is distributed under the [MIT license](LICENSE).
