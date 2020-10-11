Pack Buildkite Plugin
=====================

A Buildkite plugin for building application images from source code using
buildpacks with pack.

Example
-------

```
steps:
  - plugins:
      - vanstee/pack:
          build:
            image: "example:${BUILDKITE_COMMIT}"
```

```
steps:
  - plugins:
      - vanstee/pack:
          build:
            image: "example:${BUILDKITE_COMMIT}"
            docker-compose-service: example

  - command: scripts/test
    plugins:
      - docker-compose:
          run: example
```
