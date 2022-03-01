#!/bin/sh
export ANDROID_SDK=~/Android/Sdk
python3 -m venv ~/.venvs/mariana-trench
wait
source ~/.venvs/mariana-trench/bin/activate
cd TaintBench
for file in *.apk;
	do echo "Processing $file";
	mariana-trench --system-jar-configuration-path=$ANDROID_SDK/platforms/android-31/android.jar --apk-path=$file;
	printf "###################################################################\n\n Done Processing $file\n\n###################################################################\n\n"
	#sapp --tool=mariana-trench analyze .;
	#wait
	#sapp --database-name=sapp.db server --source-directory=app/src/main/java;
	#printf "###################################################################\n\n Displaying $file\n\n###################################################################\n\n"
	#sleep 10;
done

