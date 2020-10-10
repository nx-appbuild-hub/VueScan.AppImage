SOURCE="http://mirror.kumi.systems/kde/ftp/stable/digikam/6.4.0/digikam-6.4.0-x86-64.appimage"
DESTINATION="DigiKam.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=build.tar.gz  https://d2bwyyzfw77fhf.cloudfront.net/vuex6497.tgz

	mkdir --parents ./build
	tar -zxvf build.tar.gz --directory ./build

	mkdir --parents ./AppDir/application
	cp -r build/VueScan/* ./AppDir/application/
	export ARCH=x86_64 && bin/appimagetool.AppImage  ./AppDir VueScan.AppImage

	chmod +x VueScan.AppImage

clean:
	rm -rf ./AppDir/application
	rm -rf ./build