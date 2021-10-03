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
if [[ ! -d "usr/local/lib/ruby/gems/2.5.0" ]]
then
echo "You need to have installed Ruby 2.5.0"
exit 1
fi
if [[ ! -d "/opt/geminst" ]]
then
mkdir -p "/opt/geminst"
fi
wget "$dlink" -O "/opt/geminst/gems.zip"
chksz=$(wc -c "/opt/geminst/gems.zip" | awk {'print$1'})
if [[ "$chksz" -lt "100000" ]]
then
echo "There was an error downloading gemsfile from dropbox"
exit 1
fi
unzip gems.zip -d "usr/local/lib/ruby/gems"
rm -rf /opt/geminst
}
dep && instdir
