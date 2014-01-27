echo
echo Configuring swapcaps on resume
rm -f /etc/pm/sleep.d/swapcaps
ln -s $(pwd)/conf/bin/swapcaps /etc/pm/sleep.d/swapcaps
chmod a+x /etc/pm/sleep.d/swapcaps
