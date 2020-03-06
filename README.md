## Segger Embedded Studio Docker Image

Basic image to allow Segger Embedded Studio (SES) builds from Docker.

These images exist to aid with continuous integration (CI) efforts of SES projects.

Production usage of SES and the Nordic SDK often requires that the exact SES and SDK versions be used, until new
versions can be fully qualified. As such a number of images are generated for a wide combination of SES versions and
Nordic SDK versions.

The SES tools are installed into the image under `/ses`. For my purposes, I use `/ses/bin/emBuild`.

Example:

```docker run -it --rm josschne/ses /ses/bin/emBuild```

Prints help information...


```docker run -it --rm josschne/ses /ses/bin/emBuild -v <host source file path>:/src -config 'Release' /src/test-project.emProject```

Performs a build...

Note the use of '--rm'. This causes docker to remove the container after the command has completed to avoid having tons of one-time use containers
sitting around.
