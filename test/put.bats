#!/usr/bin/env bats

load 'test_helper/common-setup'

@test 'test environment is as expected' {
	assert_regex "${HOME}" '-bash-trash$'
}

@test 'successfully trash file' {
	touch "${HOME}/puts-testfile"
	run bash-trash put "${HOME}/puts-testfile"
	assert_success
	assert_file_empty \
		"${HOME}/.local/share/Trash/files/puts-testfile"
	assert_file_contains \
		"${HOME}/.local/share/Trash/info/puts-testfile.trashinfo" \
		"^Path=${HOME}/puts-testfile$"

	touch "${HOME}/puts-testfile"
	run bash-trash put "${HOME}/puts-testfile"
	assert_success
	assert_file_empty \
		"${HOME}/.local/share/Trash/files/puts-testfile (1)"
	assert_file_contains \
		"${HOME}/.local/share/Trash/info/puts-testfile (1).trashinfo" \
		"^Path=${HOME}/puts-testfile$"
}

@test 'successfully trash directory' {
	mkdir "${HOME}/puts-testdir"
	run bash-trash put "${HOME}/puts-testdir"
	assert_success
	assert_dir_exists \
		"${HOME}/.local/share/Trash/files/puts-testdir"
	assert_file_contains \
		"${HOME}/.local/share/Trash/info/puts-testdir.trashinfo" \
		"^Path=${HOME}/puts-testdir$"

	mkdir "${HOME}/puts-testdir"
	run bash-trash put "${HOME}/puts-testdir"
	assert_success
	assert_dir_exists \
		"${HOME}/.local/share/Trash/files/puts-testdir (1)"
	assert_file_contains \
		"${HOME}/.local/share/Trash/info/puts-testdir (1).trashinfo" \
		"^Path=${HOME}/puts-testdir$"
}
