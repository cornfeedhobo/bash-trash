#!/usr/bin/env bash

setup() {
	load 'test_helper/bats-support/load'
	load 'test_helper/bats-assert/load'
	load 'test_helper/bats-file/load'

	export BASH_TRASH_TMP_DIR="$(mktemp --directory --suffix=-bash-trash)"
	export HOME="${BASH_TRASH_TMP_DIR}"

	# make directories for the mocked trash files
	mkdir -p "${HOME}/.local/share/Trash/files"
	mkdir -p "${HOME}/.local/share/Trash/info"

	# make a test file
	touch "${HOME}/.local/share/Trash/files/testfile"
	cat > "${HOME}/.local/share/Trash/info/testfile.trashinfo" <<-EOF
		[Trash Info]
		Path=${HOME}/testfile
		DeletionDate=1970-01-01T00:00:00
	EOF

	# make a test directory
	mkdir "${HOME}/.local/share/Trash/files/testdir"
	touch "${HOME}/.local/share/Trash/files/testdir/testdirfile"
	cat > "${HOME}/.local/share/Trash/info/testdir.trashinfo" <<-EOF
		[Trash Info]
		Path=${HOME}/testdir
		DeletionDate=1970-01-01T00:00:00
	EOF

	# make a tmp test file
	touch "${HOME}/.local/share/Trash/files/testfile (1)"
	cat > "${HOME}/.local/share/Trash/info/testfile (1).trashinfo" <<-EOF
		[Trash Info]
		Path=/tmp/testfile
		DeletionDate=1970-01-01T00:00:00
	EOF
}

teardown() {
	rm -rf "${BASH_TRASH_TMP_DIR}"
}
