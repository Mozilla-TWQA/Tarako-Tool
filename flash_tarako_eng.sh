TARGET_BUILD="B2G.v1.3.0.Tarako.eng"

rm -rf b2g-distro
rm ${TARGET_BUILD}.zip

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/${TARGET_BUILD}/lastSuccessfulBuild/artifact/out/${TARGET_BUILD}.zip

unzip ${TARGET_BUILD}.zip

adb reboot-bootloader
fastboot flash boot b2g-distro/out/target/product/*/boot.img
fastboot flash system b2g-distro/out/target/product/*/system.img
fastboot flash userdata b2g-distro/out/target/product/*/userdata.img

fastboot reboot
