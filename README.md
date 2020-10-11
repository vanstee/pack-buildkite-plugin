Pack Buildkite Plugin
=====================

A Buildkite plugin for building application images from source code using
buildpacks with pack.

Example
-------

```
steps:
  - command: test.sh
    plugins:
      - vanstee/pack:
          build:
            image: "example:${BUILDKITE_COMMIT}"
```
