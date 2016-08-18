
#!/bin/bash

BASE_DIR="/vagrant"
RPM_DIR="${BASE_DIR}/rpm"
JDK_VERSION=8u73
BUILD_NO=b02
JAVA_RPM_NAME="jdk-${JDK_VERSION}-linux-x64.rpm"
JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/${JDK_VERSION}-${BUILD_NO}/${JAVA_RPM_NAME}"

# create dir
if [ ! -d ${RPM_DIR} ]
then
  mkdir -p ${RPM_DIR}
else
  echo "${RPM_DIR} Is Already Exists So Need Not Create"
fi

# if "rpm for jdk file" is noting
if [ ! -f ${RPM_DIR}/${JAVA_RPM_NAME} ]
then
  wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" ${JDK_DOWNLOAD_URL}  -O /tmp/${JAVA_RPM_NAME}
  mv /tmp/${JAVA_RPM_NAME} ${RPM_DIR}/
else
  echo "${JAVA_RPM_NAME} Is Already Exists So Need Not Wget"
fi

# install jdk
which java > /dev/null 2>&1
if [ $0 -eq 0 ]; then
    echo "Java version is ${java -version} "
else
    sudo rpm -ivh ${RPM_DIR}/${JAVA_RPM_NAME}
fi