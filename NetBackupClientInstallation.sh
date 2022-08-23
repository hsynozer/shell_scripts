
#!/bin/sh

echo 'This script for NetBackup Client installation'

read -p "please enter your master server backup ip address : " masterip
os=$(uname)

#This installation for Linux Operating System

if [[ "${os}" == "Linux" ]]; then
 echo 'Operating System' $os
 if [ -d "/usr/openv)" ]; then
    echo "/usr/openv exists on system"
    echo "Checking disk availability..."
    diskfree=$(df -hP /usr/openv | awk '{print $5}' | sed 's/%//g' | tail -n 1)
        if (( "${diskfree}" <= 1 )); then
            echo "Disk Empty."
            /usr/bin/mkdir -p /tmp/netbackup
            ping -c 5 -w 10 $masterip >& /dev/null
            if [[ $? == "0" ]]; then
                echo "Host is up"
                dzdo /bin/mount -t nfs $masterip:/var/crash/netbackup /tmp/netbackup 
                cd /tmp/netbackup/
                /usr/bin/sh install
            else
                echo 'Host is Unreachable'
            exit 0  
            fi

        else
           echo 'Disk is not empty. Disk Usage %'$diskfree
          exit 0         
        fi
    else
    echo '/usr/openv does not exist on your system.Please contact your system administrator.' 
 fi

 else
    echo "Operating system is not define or something missing!!"
   exit 0
   
fi


#This installation for HP-UX Operating System

elif [[ "${os}" == "HP-UX" ]]; then
echo 'Operating System' $os
 if [ -d "/usr/openv)" ]; then
    echo "/usr/openv exists on system"
    echo "Checking disk availability..."
    diskfree=$(df -kP /usr/openv | awk '{print $5}' | sed 's/%//g' | tail -n 1)
        if (( "${diskfree}" <= 1 )); then
            echo "Disk Empty."
            /usr/bin/mkdir -p /tmp/netbackup
            ping -c 5 -w 10 $masterip >& /dev/null
            if [[ $? == "0" ]]; then
                echo "Host is up"
                dzdo /usr/sbin/mount -F nfs $masterip:/var/crash/netbackup /tmp/netbackup 
                cd /tmp/netbackup/
                /usr/bin/sh install
            else
                echo 'Host is Unreachable'
            exit 0  
            fi

        else
           echo 'Disk is not empty. Disk Usage %'$diskfree
          exit 0         
        fi
    else
    echo '/usr/openv does not exist on your system.Please contact your system administrator.' 
 fi
 else
    echo "Operating system is not define or something missing!!"
   exit 0
   
fi
 

#This installation for AIX Operating System 
 
elif [[ "${os}" == "AIX" ]]; then
echo 'Operating System' $os
 if [ -d "/usr/openv)" ]; then
    echo "/usr/openv exists on system"
    echo "Checking disk availability..."
    diskfree=$(df -gP /usr/openv | awk '{print $5}' | sed 's/%//g' | tail -n 1)
        if (( "${diskfree}" <= 1 )); then
            echo "Disk Empty."
            /usr/bin/mkdir -p /tmp/netbackup
            ping -c 5 -w 10 $masterip >& /dev/null
            if [[ $? == "0" ]]; then
                echo "Host is up"
                dzdo /usr/sbin/mount nfs $masterip:/var/crash/netbackup /tmp/netbackup 
                cd /tmp/netbackup/
                /usr/bin/sh install
            else
                echo 'Host is Unreachable'
            exit 0  
            fi

        else
           echo 'Disk is not empty. Disk Usage %'$diskfree
          exit 0         
        fi
    else
    echo '/usr/openv does not exist on your system.Please contact your system administrator.' 
 fi
 else
    echo "Operating system is not define or something missing!!"
   exit 0
   
fi


#This installation for SunOS Operating System

elif [[ "${os}" == "SunOS" ]]; then
 echo 'Operating System' $os
 if [ -d "/usr/openv)" ]; then
    echo "/usr/openv exists on system"
    echo "Checking disk availability..."
    diskfree=$(df -h /usr/openv | awk '{print $5}' | sed 's/%//g' | tail -1)
        if (( "${diskfree}" <= 1 )); then
            echo "Disk Empty."
            /usr/bin/mkdir -p /tmp/netbackup
            ping -c 5 -w 10 $masterip >& /dev/null
            if [[ $? == "0" ]]; then
                echo "Host is up"
                dzdo /usr/sbin/mount -t nfs $masterip:/var/crash/netbackup /tmp/netbackup 
                cd /tmp/netbackup/
                /usr/bin/sh install
            else
                echo 'Host is Unreachable'
            exit 0  
            fi

        else
           echo 'Disk is not empty. Disk Usage %'$diskfree
          exit 0         
        fi
    else
    echo '/usr/openv does not exist on your system.Please contact your system administrator.' 
 fi

else
    echo "Operating system is not define or something missing!!"
   exit 0
   
fi
