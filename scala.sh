#!/bin/bash
# Downloads, compiles, and installs dromajo.

set -ex

cd /tmp

wget --no-verbose https://downloads.lightbend.com/scala/2.13.0/scala-2.13.0.deb
dpkg -i scala-2.13.0.deb
rm scala-2.13.0.deb

echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
apt-get update
apt-get install sbt
