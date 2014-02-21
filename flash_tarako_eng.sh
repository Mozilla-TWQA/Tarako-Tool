rm -rf b2g-distro
rm B2G.v1.3.0.Tarako.eng.zip

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/B2G.v1.3.0.Tarako.eng/lastSuccessfulBuild/artifact/out/B2G.v1.3.0.Tarako.eng.zip

unzip B2G.v1.3.0.Tarako.eng.zip

adb reboot-bootloader
fastboot flash boot b2g-distro/out/target/product/*/boot.img
fastboot flash system b2g-distro/out/target/product/*/system.img
fastboot flash userdata b2g-distro/out/target/product/*/userdata.img

fastboot reboot
