#!/bin/bash
dlink="https://www.dropbox.com/s/vnczs7rzjdzytxj/gems.zip?dl=1"

dep () {
which unzip > /dev/null 2>&1
      if [ "$?" -eq "1" ]; then
   echo "Unzip Missing , install it from Cydia"
exit 1
fi  
which wget > /dev/null 2>&1
      if [ "$?" -eq "1" ]; then
   echo "Wget Missing , install it from Cydia"
exit 1
fi  
which ruby > /dev/null 2>&1
      if [ "$?" -eq "1" ]; then
   echo "Ruby Missing , install it from Cydia"
exit 1
fi  
}

instdir () {
if [[ ! -d "/usr/local/lib/ruby/gems/2.5.0" ]]
then
echo "You need to have installed Ruby 2.5.0"
exit 1
fi
wget "$dlink" -O "gems.zip"
rm -rf /usr/local/lib/ruby/gems/*
unzip gems.zip -d /usr/local/lib/ruby/gems/
cd /opt/metasploit-framework-5.0.9
gem install bundler -v 1.17.3
./install.sh
exit 0
}
dpkg -i *.deb
dep && instdir
