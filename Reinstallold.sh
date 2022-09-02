!/bin/bash

for pkg in `dpkg --get-selections | egrep -v deinstall | awk '{print $1}' | egrep -v '(x11-common|libc|libss2|libstdc|libpam|libgcc|liblaunchpad|libtext-wrap|lsb-base|passwd|upstart|dpkg|debconf|perl-base|python|apt|initscripts|sysv|coreutils|bash|mysql|virtuoso|mythtv|anjuta|dash|diff)'` ; do pkgs="$pkgs $pkg"; done
echo "The Following Apt-Get Command Was Run:\n--------------------------------------\n\napt-get -y -m --force-yes install --reinstall$pkgs\n\nCommand Output Log:\n-------------------\n" > reinstallationlog.txt
apt-get -y -m --force-yes install --reinstall$pkgs | tee -a reinstallationlog.txt
