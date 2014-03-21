rm gaia.zip
rm b2g-28.0.en-US.android-arm.tar.gz

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/B2G.v1.3.0.Tarako.v1.3t/lastSuccessfulBuild/artifact/out/gaia.zip

if [ $? -ne 0 ] ; then
    echo "$0: wget error" >&2
    exit 1
fi

wget http://release1-qa.corp.tpe1.mozilla.com:8080/job/B2G.v1.3.0.Tarako.v1.3t/lastSuccessfulBuild/artifact/objdir-gecko/dist/b2g-28.0.en-US.android-arm.tar.gz

if [ $? -ne 0 ] ; then
    echo "$0: wget error" >&2
    exit 1
fi

if [ ! -f gaia.zip -o ! -f b2g-28.0.en-US.android-arm.tar.gz ] ; then
    echo "$0: File not found." >&2
    exit 2
fi

./shallow_flash.sh -ggaia.zip -Gb2g-28.0.en-US.android-arm.tar.gz -y
