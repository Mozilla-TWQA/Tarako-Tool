rm gaia.zip
rm b2g-28.0.en-US.android-arm.tar.gz

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/B2G.v1.3.0.Tarako.v1.3t/lastSuccessfulBuild/artifact/out/gaia.zip
wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/B2G.v1.3.0.Tarako.v1.3t/lastSuccessfulBuild/artifact/objdir-gecko/dist/b2g-28.0.en-US.android-arm.tar.gz

./shallow_flash.sh -ggaia.zip -Gb2g-28.0.en-US.android-arm.tar.gz -y
