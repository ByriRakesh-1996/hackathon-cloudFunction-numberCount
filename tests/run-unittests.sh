#!/bin/bash

echo "Current Working Directory: " `pwd`
cp -R ./target/surefire-reports/TEST-*.FunctionAppTest.xml ./unittest.xml
cp -R ./target/surefire-reports/TEST-*.SecondFunction.xml ./secondtest.xml
echo "XUnit format xml file for Unit Test which got generated in root directory: " `ls unittest.xml`
