load vars

@test "LICENSE file exists" {
  [ -r LICENSE ]
}

@test "image exists" {
  run docker images
  [[ ${output} =~ infiniband.*${version} ]]
}

@test "image does not contain doc files" {
  run docker run ${IMAGE}:${version} find /usr/share/man/ -type f
  # circleci collects output.
  delete="WARNING: Your kernel does not support memory swappiness capabilities, memory swappiness discarded."
  lines=(${lines[@]/$delete/})
  [[ ${#lines[@]} -eq 0 ]]
}
