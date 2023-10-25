#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'restore works' {
	assert_file_not_exists "${HOME}/testfile"

	run bash-trash restore 'testfile'
	assert_success

	assert_file_exists "${HOME}/testfile"
}
