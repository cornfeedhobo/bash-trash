#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'init - bash' {
	run bash-trash init - bash
	assert_success
	assert_output <<-EOF
		export PATH="\${PATH}:${PROJECT_ROOT}/bin"
		source ${PROJECT_ROOT}/completions/bash-trash.bash
	EOF
}
