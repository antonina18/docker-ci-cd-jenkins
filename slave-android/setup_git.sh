GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "${GREEN}--------------------------------\nModyfying access rights for ssh key\n--------------------------------${NC}"
chmod 400 $JENKINS_HOME/.ssh/id_rsa

cd $JENKINS_HOME/workspace

echo "${GREEN}--------------------------------\nCloning ab0-bluetooth-sdk\n--------------------------------${NC}"
git clone git@bitbucket.org:efento-android/ab0-bluetooth-sdk.git

echo "${GREEN}--------------------------------\nCloning ab1-cloud-sdk\n--------------------------------${NC}"
git clone git@bitbucket.org:efento-android/ab1-cloud-sdk.git

echo "${GREEN}--------------------------------\nCloning ab2-pdf-generator\n--------------------------------${NC}"
git clone git@bitbucket.org:efento-android/ab2-pdf-generator.git


echo "${GREEN}--------------------------------\nBuilding bluetooth sdk AARs\n--------------------------------${NC}"
cd $JENKINS_HOME/workspace/ab0-bluetooth-sdk
git checkout develop
../generate_all_bluetooth_sdk_versions.sh

echo "${GREEN}--------------------------------\nBuilding cloud sdk AARs\n--------------------------------${NC}"
cd $JENKINS_HOME/workspace/ab1-cloud-sdk
git checkout develop
../generate_all_cloud_sdk_versions.sh

echo "${GREEN}--------------------------------\nBuilding pdf sdk AARs\n--------------------------------${NC}"
cd $JENKINS_HOME/workspace/ab2-pdf-generator
git checkout develop
../generate_all_report_sdk_versions.sh
