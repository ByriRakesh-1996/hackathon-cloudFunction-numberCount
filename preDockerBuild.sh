echo Publish jar to artifactory

# read release version number from release.version file
RELEASE_VERSION=`cat release.version`
echo Release Version ${RELEASE_VERSION}

# read jar file name from function.artifact file
JAR_PACKAGE=`cat function.artifact`
echo Jar package ${JAR_PACKAGE}

mvn clean package --settings settings.xml -Dusername=${ARTIFACTORY_USER_NAME} -Dpassword=${ARTIFACTORY_API_KEY}
curl -u ${ARTIFACTORY_USER_NAME}:${ARTIFACTORY_API_KEY} -T ./target/${JAR_PACKAGE}*.jar "${JFROG_ARTIFACTORY}/${JAR_PACKAGE}-${RELEASE_VERSION}.jar"
