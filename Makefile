VERSION = $(shell cat ./VERSION)
BUILD_NUMBER = $(shell cat ./BUILDNUMBER)
MERGE_COMMIT=$(shell git rev-parse HEAD | cut -c -8 )
BUILD_NUMBER_FILE=BUILDNUMBER
CHANGE_LOG=$(shell git log -1 --pretty=%B)
FIREBASE_TOKEN = $(shell cat ./FIREBASE_TOKEN)


incrementbuild: 
	@if ! test -f $(BUILD_NUMBER_FILE); then echo 0 > $(BUILD_NUMBER_FILE); fi
	@@echo $$(($(shell cat ./BUILDNUMBER)+1)) > $(BUILD_NUMBER_FILE)
	echo $(shell cat ./BUILDNUMBER)

release_android_dev:
	# make incrementbuild
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor development -t lib/main_dev.dart --obfuscate --split-debug-info=./skytronik_android_dev

release_android_production:
	# make incrementbuild
	flutter clean
	flutter build apk --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor production -t lib/main_prod.dart --obfuscate --split-debug-info=./skytronik_android_prod

release_ios_dev:
#	make incrementbuild
#	flutter clean
	flutter build ipa --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor development --obfuscate -t lib/main_dev.dart --split-debug-info=./skytronik_ios_dev  --export-options-plist=./ios/ExportOptions.plist

release_ios_production:
	# make incrementbuild
	flutter clean
	flutter build ipa --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor production -t lib/main_prod.dart --obfuscate --split-debug-info=./skytronik_ios_prod  --export-options-plist=./ios/ExportOptions.plist

release_firebase_android_dev:
	# make incrementbuild
	fvm flutter clean
	fvm flutter build apk --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor development -t lib/main_dev.dart --obfuscate --split-debug-info=./lugu_superapps_dev
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-development-release.apk  \
		--app 1:901307950886:android:4d17bbff2f3ed528de83e7 \
		--groups "lugu-tester-group" \
		--release-notes-file "release_notes.txt" \
		--token "${FIREBASE_TOKEN}"


release_firebase_android_prod:
	# make incrementbuild
	fvm flutter clean
	fvm flutter build apk --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor production -t lib/main_prod.dart --obfuscate --split-debug-info=./lugu_superapps
	firebase appdistribution:distribute build/app/outputs/flutter-apk/app-production-release.apk  \
		--app 1:901307950886:android:ea68746924816cccde83e7  \
		--groups "lugu-tester-group" \
		--release-notes "[PROD] ${CHANGE_LOG}" \
		--token "${FIREBASE_TOKEN}"

release_android_playstore:
	# make incrementbuild
	fvm flutter clean
	fvm flutter build appbundle --release --build-name=$(VERSION) --build-number=$(shell cat ./BUILDNUMBER) --flavor production -t lib/main_prod.dart  --obfuscate --split-debug-info=./lugu_superapps
