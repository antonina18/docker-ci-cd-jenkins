GREEN='\033[0;32m'
NC='\033[0m' # No Color

############################
# JDK 8 (Orcale)
############################
echo "${GREEN}--------------------------------\nInstalling add-apt-repository dependencies\n--------------------------------${NC}"
apt-get update
apt-get install -y software-properties-common

echo "${GREEN}--------------------------------\nInstalling JDK8 (Oracle)\n--------------------------------${NC}"
add-apt-repository -y ppa:webupd8team/java
hasRepository=$?

if [ $hasRepository -eq 0 ]; then 
	echo "${GREEN}--------------------------------\nJava8 Repository found.\n--------------------------------${NC}" 
else 
	echo "${GREEN}--------------------------------\nRepository not found. Installing Java8 Repository.\n--------------------------------${NC}"
	apt-get install -y software-properties-common
	add-apt-repository -y ppa:webupd8team/java
fi

apt update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt -y install oracle-java8-set-default
java -version
javac -version


############################
# Android SDK
############################
echo "${GREEN}--------------------------------\nInstalling zip and unzip\n--------------------------------${NC}"
apt-get -y install zip
apt-get -y install unzip

echo "${GREEN}--------------------------------\nInstalling Android SDK\n--------------------------------${NC}"
wget -t 0 https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
unzip sdk-tools-linux-4333796.zip -d $ANDROID_HOME
yes | $ANDROID_HOME/tools/android update sdk --no-ui
apt-get -y install lib32stdc++6 lib32z1

echo "${GREEN}--------------------------------\nAccepting licenses\n--------------------------------${NC}"
yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses
chmod -R 777 $ANDROID_HOME


############################
# GIT
############################
echo "${GREEN}--------------------------------\nInstalling git\n--------------------------------${NC}"
apt-get install -y git


############################
# RCLONE
############################
echo "${GREEN}--------------------------------\nInstalling curl\n--------------------------------${NC}"
apt-get install -y curl

echo "${GREEN}--------------------------------\nInstalling RClone\n--------------------------------${NC}"
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
cp rclone /usr/bin/
chmod 755 /usr/bin/rclone
cd /
