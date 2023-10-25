#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'empty trash directory' {
	run bash-trash lsd --no-fzf
	assert_success
	assert_regex '^$'
}

@test 'list trash items from the current directory' {
	cd "${HOME}"
	run bash-trash lsd --no-fzf
	assert_success
	assert_output "$(cat <<-EOF
		1970-01-01 00:00:00 F ${HOME}/testfile | testfile
		1970-01-01 00:00:00 D ${HOME}/testdir | testdir
	EOF
	)"
}
