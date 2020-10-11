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
