
SSHKEY = ~/.ssh/id_rsa
DEPEND_COMMAND = perl po4a emacs texi2any

##################################################

.PHONY: all commit log

all:

show-versions: $(DEPEND_COMMAND:%=.make-version-%)
	@:

.make-version-%:
	@echo "\n===================="
	-$* --version

commit: SSHKEY melpa-archive
	git remote -v
	git remote set-url origin git@github.com:conao3/playground.git

	git checkout master
	git add .
	git commit -m "by Travis CI (job $$TRAVIS_JOB_NUMBER) [skip ci]"

	git push origin master

log:
	echo "Commit by Travis-CI (job $$TRAVIS_JOB_NUMBER)" >> commit.log

SSHKEY:
	openssl aes-256-cbc -K $$encrypted_c34d5bfe7b07_key -iv $$encrypted_c34d5bfe7b07_iv -in travis_rsa.enc -out ~/.ssh/id_rsa -d
	chmod 600 ~/.ssh/id_rsa
