TARGET_BUILD="B2G.v1.3.0.Tarako.eng"

rm -rf b2g-distro
rm ${TARGET_BUILD}.zip

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/${TARGET_BUILD}/lastSuccessfulBuild/artifact/out/${TARGET_BUILD}.zip

if [ $? -ne 0 ] ; then
    echo "$0: wget error" >&2
    exit 1
fi

if [ ! -f ${TARGET_BUILD}.zip ] ; then
    echo "$0: File not found." >&2
    exit 2
fi

unzip ${TARGET_BUILD}.zip

if [ $? -ne 0 ]; then
    echo "$0: unzip error." >&2
    exit 3
fi

adb reboot-bootloader
fastboot flash boot b2g-distro/out/target/product/*/boot.img
fastboot flash system b2g-distro/out/target/product/*/system.img
fastboot flash userdata b2g-distro/out/target/product/*/userdata.img

fastboot reboot
