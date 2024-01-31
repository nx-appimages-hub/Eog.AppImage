# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

.PHONY: all

all: clean init

	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate eog \
		eog-plugin-exif-display eog-plugin-export-to-folder eog-plugin-fit-to-width \
		eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-map \
		eog-plugin-maximize-windows eog-plugin-picasa eog-plugin-python-console eog-plugin-send-by-mail \
		eog-plugin-slideshow-shuffle eog-plugins eog-plugins-common \
		libwayland-cursor0 libselinux1 

	echo ''                                      >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                      >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo "exec \$${APPDIR}/bin/eog \"\$${@}\""   >> $(PWD)/build/Boilerplate.AppDir/AppRun

	rm --force $(PWD)/build/Boilerplate.AppDir/*.desktop		| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.svg			| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.png			| true

	cp -r --force $(PWD)/AppDir/*.desktop	$(PWD)/build/Boilerplate.AppDir/	| true
	cp -r --force $(PWD)/AppDir/*.svg		$(PWD)/build/Boilerplate.AppDir/ 	| true
	cp -r --force $(PWD)/AppDir/*.png		$(PWD)/build/Boilerplate.AppDir/ 	| true

	export ARCH=x86_64 && bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Eog.AppImage
	chmod +x $(PWD)/Eog.AppImage


init:
	mkdir --parents $(PWD)/bin

	wget https://github.com/area-of-dev/apprepo.AppImage/releases/download/latest/apprepo.AppImage \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
