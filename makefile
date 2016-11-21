# makefile for calcurse box scripts
# run as root, needs to install in /usr/local/bin

all:
	@echo "Installing Required packages..."
	@if [[ -z `whereis cadaver` ]]; then pkg_add cadaver; fi
	@if [[ -z `whereis expect` ]]; then pkg_add expect; fi
	@echo "Moving scripts to /usr/local/bin ..."
	@cp src/cc_box_put.expect /usr/local/bin/
	@cp src/cc_box_get.expect /usr/local/bin/
	@cp src/calc* /usr/local/bin/
	@echo "Setting up Box directory structure"
	@src/cc_box_setup.expect
	@echo "Done!"

update:
	@echo getting repo
	@git pull origin master
	@doas make

deinstall:
	@echo "Removing Script"
	@rm /usr/local/bin/cc_box_*
	@rm /usr/local/bin/calcput
	@rm /usr/local/bin/calcget
	@echo "Removing calcurse_box Repository..."
	@cd ../; rm -rf calcurse_box
	@echo "Done!"
