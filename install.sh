#! /bin/bash
clear
printf '\033]2;INSTALLER\a'
echo -e "Press \e[1;33many key\e[0m to install the framework..."
read -n 1
clear
apt-get -y install gnome-terminal
clear
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ "$DIR" != "/root/hkit" ]]
then
	echo -e "Installing Hackkit Framework"
	sleep 4
	if [[ -d /root/hkit ]]
	then
		rm -r /root/hkit
	fi
	mkdir /root/hkit
	cp -r "$DIR"/* /root/hkit
	chmod +x /root/hkit/install.sh
	gnome-terminal -- "bash /root/hkit/install.sh"
fi
echo -e "Installing hkit..."
sleep 1
echo -e "Fixing permissions"
sleep 2
chmod +x /root/hkit/lh1
chmod +x /root/hkit/lh2
chmod +x /root/hkit/lh3
chmod +x /root/hkit/lh31
chmod +x /root/hkit/hkit
chmod +x /root/hkit/lh4
chmod +x /root/hkit/lh41
chmod +x /root/hkit/lh21
chmod +x /root/hkit/lh42
chmod +x /root/hkit/lh43
chmod +x /root/hkit/hk/l131.sh
chmod +x /root/hkit/hk/l132.sh
chmod +x /root/hkit/hk/l133.sh
chmod +x /root/hkit/uninstall.sh
clear
echo -e "Copying script to /bin/hkit"
sleep 1
mkdir /bin/hkit
cd /root/hkit
cp /root/hkit/hkit /bin/hkit
cp /root/hkit/lh1 /bin/hkit
cp /root/hkit/lh2 /bin/hkit
cp /root/hkit/lh3 /bin/hkit
cp /root/hkit/lh31 /bin/hkit
cp /root/hkit/lh4 /bin/hkit
cp /root/hkit/lh41 /bin/hkit
cp /root/hkit/lh21 /bin/hkit
cp /root/hkit/lh42 /bin/hkit
cp /root/hkit/lh43 /bin/hkit
clear
#required for gui
apt-get -y install ncurses-dev
clear
if [[ ! -d /root/handshakes ]]
then
	mkdir /root/handshakes
	echo -e "Made /root/handshake directory"
else
	echo -e "/root/handshakes directory detected.Good."
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir /root/wordlists
	echo -e "Made /root/wordlists directory"
else
	echo -e "/root/wordlists directory detected.Good."
fi
while true
do
clear
echo -e "Are you \e[1;33mu\e[0mpdating or \e[1;33mi\e[0mnstalling the script?(\e[1;33mu\e[0m/\e[1;33mi\e[0m): "
echo -e "Only use 'i' for the first time."
read UORI
if [[ "$UORI" = "u" ]]
then 
	clear
	echo -e "Type 'changelog' to see what's new on this version"
	sleep 3
	break
elif [[ "$UORI" = "i" ]]
then
	clear
	BASHCHECK=$(cat ~/.bashrc | grep "bin/hkit")
	if [[ "$BASHCHECK" != "" ]]
	then
		echo -e "I SAID USE i ONLY ONE TIME..........."
		sleep 3
	fi
	echo -e "Adding hkit to PATH so you can access it from anywhere"
	sleep 1
	export PATH=/bin/hkit:$PATH
	sleep 1
	echo "export PATH=/bin/hkit:$PATH" >> ~/.bashrc
	sleep 1
	clear
	break
fi
done
clear
echo -e "DONE"
sleep 1
clear
echo -e "Open a NEW terminal and type 'hkit' to launch the script"
sleep  4
gnome-terminal -- l
exit
