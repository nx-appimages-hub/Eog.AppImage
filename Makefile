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


all: clean

	mkdir --parents $(PWD)/build/Eog.AppDir
	apprepo --destination=$(PWD)/build appdir eog eog-plugin-exif-display eog-plugin-export-to-folder eog-plugin-fit-to-width \
												eog-plugin-fullscreen-background eog-plugin-hide-titlebar eog-plugin-map \
												eog-plugin-maximize-windows eog-plugin-picasa eog-plugin-python-console eog-plugin-send-by-mail \
												eog-plugin-slideshow-shuffle eog-plugins eog-plugins-common

	echo "exec \$${APPDIR}/bin/eog \"\$${@}\"" >> $(PWD)/build/Eog.AppDir/AppRun

	rm --force $(PWD)/build/Eog.AppDir/*.desktop		| true
	rm --force $(PWD)/build/Eog.AppDir/*.svg			| true
	rm --force $(PWD)/build/Eog.AppDir/*.png			| true

	cp -r --force $(PWD)/AppDir/*.desktop	$(PWD)/build/Eog.AppDir/	| true
	cp -r --force $(PWD)/AppDir/*.svg		$(PWD)/build/Eog.AppDir/ 	| true
	cp -r --force $(PWD)/AppDir/*.png		$(PWD)/build/Eog.AppDir/ 	| true

	export ARCH=x86_64 && bin/appimagetool.AppImage $(PWD)/build/Eog.AppDir $(PWD)/Eog.AppImage
	chmod +x $(PWD)/Eog.AppImage

clean:
	rm -rf $(PWD)/build
