#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'runs successfully' {
	run bash-trash
	assert_success
}
