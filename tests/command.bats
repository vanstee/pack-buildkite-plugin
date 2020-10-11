#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Builds an image with pack" {
  export BUILDKITE_PLUGIN_PACK_BUILD_IMAGE="example"

  stub pack "build example : "

  run "$PWD/hooks/command"

  unstub pack

  assert_success
  assert_output <<EOF
--- Building an image with pack
EOF
}

@test "Sets metadata for docker-compose plugin" {
  export BUILDKITE_PLUGIN_PACK_BUILD_IMAGE="example"
  export BUILDKITE_PLUGIN_PACK_BUILD_DOCKER_COMPOSE_SERVICE="example"

  stub pack "build example : "
  stub buildkite-agent "meta-data set built-image-tag-example example : "

  run "$PWD/hooks/command"

  unstub pack
  unstub buildkite-agent

  assert_success
  assert_output <<EOF
--- Building an image with pack
--- Setting metadata for docker-compose plugin
EOF
}
