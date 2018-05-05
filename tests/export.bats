#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

@test "Exports metadata to env" {
  export BUILDKITE_PLUGIN_METADATA_ENV_KEYS_0="FOO"
  export BUILDKITE_PLUGIN_METADATA_ENV_KEYS_1="BAR"

  stub buildkite-agent \
    "meta-data get FOO : echo BAR" \
    "meta-data get BAR : echo TENDER"

  run $PWD/hooks/environment

  assert_success
  assert_output --partial "FOO=(3 chars)"
  assert_output --partial "BAR=(6 chars)"
}