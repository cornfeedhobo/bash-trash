#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'empty trash directory' {
	run bash-trash ls --no-fzf
	assert_success
}

@test 'list all trash items' {
	run bash-trash ls --no-fzf
	assert_success
	assert_output "$(cat <<-EOF
		1970-01-01 00:00:00 F ${HOME}/testfile | testfile
		1970-01-01 00:00:00 F /tmp/testfile | testfile (1)
		1970-01-01 00:00:00 D ${HOME}/testdir | testdir
	EOF
	)"
}
