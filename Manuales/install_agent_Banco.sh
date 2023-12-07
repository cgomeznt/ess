#!/bin/bash

DATE=$(date +%d%m%Y-+%M%S)

clear
echo -e "\n\e[32mPaso: verificar si es RHEL 9\n\e[39m"
sleep 1
cat /etc/redhat-release | grep Rocky && echo "Si es Rocky Linux" || exit 1 

clear
echo -e "\n\e[32mPaso: Instalar EPEL\n\e[39m"
sleep 1
dnf install epel-release.noarch 
if [ ! $? -eq 0 ] ; then
	echo -e "\n\e[31mERR - Paso: Instalar EPEL\n\e[39m"
	exit 20
fi
sleep 1

clear
echo -e "\n\e[32mPaso: Hacer Update\n\e[39m"
sleep 1
dnf update 
if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Hacer Update\n\e[39m" 
        exit 20
fi
sleep 1


clear
echo -e "\n\e[32mPaso: Instalar dependencias\n\e[39m"
sleep 1
dnf install wget bind-utils net-tools nmap telnet tcpdump nload tar bzip2 gzip unzip unrar lsof rsyslog rsync openssl s-nail bc xorg-x11-server-Xorg.x86_64 xorg-x11-xauth.x86_64 
if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Instalar dependencias\n\e[39m"
        exit 20
fi
sleep 1

clear
echo -e "\n\e[32mPaso: Preparar Directorios\n\e[39m"
sleep 1
mkdir -p /opt/mq_instaladores/mqm

if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Preparar Directorios - MKDIR\n\e[39m"
        exit 20
fi
sleep 1

cd /root 
if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Preparar Directorios - cd /root\n\e[39m"
        exit 20
fi
pwd
sleep 1

/usr/bin/tar -xvf /root/IBM_MQ_9.1_LINUX_X86-64.tar.gz -C /opt/mq_instaladores/mqm/
if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Preparar Directorios - tar ‐xvf IBM_MQ_9.1\n\e[39m"
        exit 20
fi

cd /opt/mq_instaladores/mqm/MQServer/
if [ ! $? -eq 0 ] ; then
        echo -e "\n\e[31mERR - Paso: Preparar Directorios - cd /opt/mq_instaladores/mqm/MQServer\n\e[39m"
        exit 20
fi

ls
sleep 1


clear
echo -e "\n\e[32mPaso: Aceptar la Licencia\n\e[39m"
sleep 1
/opt/mq_instaladores/mqm/MQServer/mqlicense.sh ‐‐text_only

clear
echo -e "\n\e[32mPaso: Instalar RPM\n\e[39m"
sleep 1

rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesRuntime*
rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesJ*
rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesServer*
rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesFT*

if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Instalar RPM\n\e[39m"
       exit 20
fi
sleep 1


clear
echo -e "\n\e[32mPaso: Endurecimiento del SO\n\e[39m"
sleep 1
cp -dp /etc/sysctl.conf /etc/sysctl.conf.orig
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Endurecimiento del SO - cp /etc/sysctl.conf.orig\n\e[39m"
       exit 20
fi
echo -e "fs.file-max = 524288
kernel.threads-max = 32768" >> /etc/sysctl.conf
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Endurecimiento del SO - echo /etc/sysctl.conf\n\e[39m"
       exit 20
fi
cp -dp /etc/security/limits.conf /etc/security/limits.conf.orig
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Endurecimiento del SO - cp /etc/security/limits.conf.orig\n\e[39m"
       exit 20
fi

echo -e "mqm soft nofile 10240
mqm hard nofile 10240

mqm soft nproc 4096
mqm hard nproc 4096">> /etc/security/limits.conf
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Endurecimiento del SO - echo /etc/security/limits.conf\n\e[39m"
       exit 20
fi

sysctl -p
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Endurecimiento del SO - sysctl -p\n\e[39m"
       exit 20
fi
sleep 1


clear
echo -e "\n\e[32mPaso: Que se cumpla todos los PASS\n\e[39m"
sleep 1
su mqm -c "/opt/mqm/bin/mqconfig"
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Que se cumpla todos los PASS\n\e[39m" 
       exit 20
fi

sleep 2


clear
echo -e "\n\e[32mPaso: Preparar archivos de configuracion para el usuario mqm\n\e[39m"
sleep 1

cp /root/.bash_profile /var/mqm/
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Preparar archivos de configuracion para el usuario mqm - cp /root/.bash_profile\n\e[39m"
       exit 20
fi

cp /etc/bashrc /var/mqm/.bashrc
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Preparar archivos de configuracion para el usuario mqm - cp /root/.bashrc\n\e[39m"
       exit 20
fi

chown mqm. /var/mqm/.bash*
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Preparar archivos de configuracion para el usuario mqm - chown /var/mqm/\n\e[39m"
       exit 20
fi


cd  /opt/mqm/bin
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Preparar archivos de configuracion para el usuario mqm - cd/opt/mqm/bin\n\e[39m"
       exit 20
fi

source /opt/mqm/bin/setmqenv -s
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Preparar archivos de configuracion para el usuario mqm - source /opt/mqm/bin/setmqenv\n\e[39m"
       exit 20
fi


clear
echo -e "\n\e[32mPaso: Consulta de la version del MQ\n\e[39m"
sleep 1
dspmqver
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Consulta de la version del MQ\n\e[39m"
       exit 20
fi
sleep 2

echo -e 'export PATH=$PATH:/opt/mqm/bin' >> /var/mqm/.bashrc

touch /usr/local/bin/config.sh
echo -e 'fteSetupCoordination -f -coordinationQMgr MQ01CRD -coordinationQMgrHost mq-server -coordinationQMgrPort 1414 -coordinationQMgrChannel SYSTEM.DEF.SVRCONN

fteSetupCommands -f -connectionQMgr MQ01CMM -connectionQMgrHost mq-server -connectionQMgrPort 1416 -connectionQMgrChannel SYSTEM.DEF.SVRCONN

fteCreateAgent -f -agentName BAN01AGN.AG -agentQMgr BAN01AGN -agentQMgrHost mq-server -agentQMgrPort 1420 -agentQMgrChannel SYSTEM.DEF.SVRCONN -agentDesc "Agent BAN01AGN"' > /usr/local/bin/config.sh

chown -R mqm. /usr/local/bin

chmod +x /usr/local/bin/config.sh


clear
echo -e "\n\e[32mPaso: Iniciar sesion con mqm  \n\e[39m"
sleep 1
su - mqm
if [ ! $? -eq 0 ] ; then
       echo -e "\n\e[31mERR - Paso: Iniciar sesion con mqm  \n\e[39m"
       exit 20
fi


touch /etc/qm.conf

