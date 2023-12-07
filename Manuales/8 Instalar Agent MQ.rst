Instalar un Agente MQ MFT en Linux
=====================================

1.‐ Debemos tener instaladas los paquetes libgcc y libstdc++::

	# rpm -qa | egrep "libgcc|libstdc++"
	libstdc++-4.8.5-44.el7.x86_64
	libgcc-4.8.5-44.el7.x86_64
	libstdc++-4.8.5-44.el7.i686
	libgcc-4.8.5-44.el7.i686

Le colocamos un nombre al servidor::

	# hostnamectl set-hostname mq-serve

Garantizar que el DNS este respondiendo adecuadamente.

**NOTA**: MQ corre bajo una maquina virtual de JAVA, pero no es necesario instalarla porque ya viene embebida en el MQ MFT.

2.‐ Bajamos los instaladores de la pagina del fabricante, los archivos son::

	IBM_MQ_9.1_LINUX_X86-64.tar.gz

**NOTA**: Ya en MQ MFT el mismo instalador en donde viene el server, ya trae el instalador del agente. Anteriormente en MQ FTE el instalador del server y el instalador del agente, eran totalmente distintos


3.‐ Descomprimimos IBM_MQ_9.1_LINUX_X86-64.tar.gz y se colocan en un directorio temporal, en este caso: /opt/mq_instaladores::

	# mkdir -p /opt/mq_instaladores/mqm
	# tar ‐xvf IBM_MQ_9.1_LINUX_X86-64.tar.gz ‐C /opt/mq_instaladores/mqm

4.- Visualizar el contenido::

	# ls
	MQServer
	# cd /opt/mq_instaladores/mqm/MQServer/
	# ls
	Advanced                             MQSeriesFTService-9.1.0-0.x86_64.rpm  MQSeriesMsg_pl-9.1.0-0.x86_64.rpm
	copyright                            MQSeriesFTTools-9.1.0-0.x86_64.rpm    MQSeriesMsg_pt-9.1.0-0.x86_64.rpm
	crtmqpkg                             MQSeriesGSKit-9.1.0-0.x86_64.rpm      MQSeriesMsg_ru-9.1.0-0.x86_64.rpm
	lap                                  MQSeriesJava-9.1.0-0.x86_64.rpm       MQSeriesMsg_Zh_CN-9.1.0-0.x86_64.rpm
	licenses                             MQSeriesJRE-9.1.0-0.x86_64.rpm        MQSeriesMsg_Zh_TW-9.1.0-0.x86_64.rpm
	mqlicense.sh                         MQSeriesMan-9.1.0-0.x86_64.rpm        MQSeriesRuntime-9.1.0-0.x86_64.rpm
	MQSeriesAMQP-9.1.0-0.x86_64.rpm      MQSeriesMsg_cs-9.1.0-0.x86_64.rpm     MQSeriesSamples-9.1.0-0.x86_64.rpm
	MQSeriesAMS-9.1.0-0.x86_64.rpm       MQSeriesMsg_de-9.1.0-0.x86_64.rpm     MQSeriesSDK-9.1.0-0.x86_64.rpm
	MQSeriesBCBridge-9.1.0-0.x86_64.rpm  MQSeriesMsg_es-9.1.0-0.x86_64.rpm     MQSeriesServer-9.1.0-0.x86_64.rpm
	MQSeriesClient-9.1.0-0.x86_64.rpm    MQSeriesMsg_fr-9.1.0-0.x86_64.rpm     MQSeriesSFBridge-9.1.0-0.x86_64.rpm
	MQSeriesExplorer-9.1.0-0.x86_64.rpm  MQSeriesMsg_hu-9.1.0-0.x86_64.rpm     MQSeriesWeb-9.1.0-0.x86_64.rpm
	MQSeriesFTAgent-9.1.0-0.x86_64.rpm   MQSeriesMsg_it-9.1.0-0.x86_64.rpm     MQSeriesXRService-9.1.0-0.x86_64.rpm
	MQSeriesFTBase-9.1.0-0.x86_64.rpm    MQSeriesMsg_ja-9.1.0-0.x86_64.rpm     READMES
	MQSeriesFTLogger-9.1.0-0.x86_64.rpm  MQSeriesMsg_ko-9.1.0-0.x86_64.rpm     repackage


5.‐ Aceptamos la licencia::

	# /opt/mq_instaladores/mqm/MQServer/mqlicense.sh  --accept

Pulsamos 1, para aceptar la licencia::

	Pulse Intro para seguir visualizando el acuerdo de 
	licencia, o entre "1" para aceptar el acuerdo, "2" para no 
	aceptarlo, "3" para imprimirlo, "4" para leer los términos 
	que no son IBM, "5" para visualizarlo en inglés o "99" para 
	volver a la pantalla anterior.
	1

	Agreement accepted:  Proceed with install.


6.‐ Solo instalamos los siguientes componentes::
	MQSeriesRuntime-9.1.0-0
	MQSeriesJRE-9.1.0-0
	MQSeriesJava-9.1.0-0  
	MQSeriesServer-9.1.0-0
	MQSeriesFTBase-9.1.0-0 
	MQSeriesFTAgent-9.1.0-0
	MQSeriesFTService-9.1.0-0
	MQSeriesFTLogger-9.1.0-0
	MQSeriesFTTools-9.1.0-0

7.- instalar los componentes ejecutando::

	# rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesRuntime*
	# rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesJ*
	# rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesServer*
	# rpm -ivh /opt/mq_instaladores/mqm/MQServer/MQSeriesFT*

8.- Automáticamente se crean los binarios en la ruta /opt/mqm/bin. Ingresar al archivo /etc/bashrc  ó /etc/profile, Anadir líneas::

	# vi /etc/bashrc
	export PATH=$PATH:/opt/mqm/bin


9.- Es bueno ejecutar el comando su mqm -c "/opt/mqm/bin/mqconfig" para ver los FAIL y WARNING, que se deben corregir::


10.‐ Nos cambiamos al usuario mqm, (El instalador crea el usuario), Es Opcional::

	# su - mqm
	$ cp /etc/bashrc .profile
	$ source .profile

En el directorio MQ_INSTALLATION_PATH/bin, estan los binarios::

	$ ls  /opt/mqm/bin


11.- Ejecutamos el comando crtmqenv -s ::

	$ crtmqenv -s
	CLASSPATH=/opt/mqm/java/lib/com.ibm.mq.jar:/opt/mqm/java/lib/com.ibm.mqjms.jar:/opt/mqm/java/lib/com.ibm.mq.allclient.jar:/opt/mqm/samp/wmqjava/samples:/opt/mqm/samp/jms/samples
	LD_LIBRARY_PATH=
	MANPATH=/opt/mqm/man:/usr/share/man
	MQ_DATA_PATH=/var/mqm
	MQ_ENV_MODE=64
	MQ_INSTALLATION_NAME=Installation1
	MQ_INSTALLATION_PATH=/opt/mqm
	MQ_JAVA_DATA_PATH=/var/mqm
	MQ_JAVA_INSTALL_PATH=/opt/mqm/java
	MQ_JAVA_JVM_FLAG=
	MQ_JAVA_LIB_PATH=/opt/mqm/java/lib64
	MQ_JRE_PATH=/opt/mqm/java/jre64/jre
	PATH=/opt/mqm/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin

El comando anterior es una muy buena idea hacer un stdout hacia .profile. Es Opcional.


En los siguientes pasos tiene la IP de ejemplo: 192.168.1.110, deben utilizar la IP que le corresponde al Servidor de MQ ORIONIS.

12.- Ejecutamos el siguiente comando para crear el Coordinator::

	$ fteSetupCoordination -coordinationQMgr MQ01CRD -coordinationQMgrHost 192.168.1.110 -coordinationQMgrPort 1414 -coordinationQMgrChannel SYSTEM.DEF.SVRCONN

Ejecución y salida del comando anterior::

	$ fteSetupCoordination -coordinationQMgr MQ01CRD -coordinationQMgrHost 192.168.1.110 -coordinationQMgrPort 1414 -coordinationQMgrChannel SYSTEM.DEF.SVRCONN
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCM0242I: Direct the following MQSC definitions for your coordination queue manager 'MQ01CRD' to an MQSC session if you have not already done so.

	DEFINE TOPIC('SYSTEM.FTE') TOPICSTR('SYSTEM.FTE') REPLACE
	ALTER TOPIC('SYSTEM.FTE') NPMSGDLV(ALLAVAIL) PMSGDLV(ALLAVAIL)
	DEFINE QLOCAL(SYSTEM.FTE) LIKE(SYSTEM.BROKER.DEFAULT.STREAM) REPLACE
	ALTER QLOCAL(SYSTEM.FTE) DESCR('Stream for MQMFT Pub/Sub interface')
	* Altering namelist: SYSTEM.QPUBSUB.QUEUE.NAMELIST
	* Value prior to alteration:
	DISPLAY NAMELIST(SYSTEM.QPUBSUB.QUEUE.NAMELIST)
	ALTER NAMELIST(SYSTEM.QPUBSUB.QUEUE.NAMELIST) +
	 NAMES(SYSTEM.BROKER.DEFAULT.STREAM+
	 ,SYSTEM.BROKER.ADMIN.STREAM,SYSTEM.FTE)
	* Altering PSMODE.  Value prior to alteration:
	DISPLAY QMGR PSMODE
	ALTER QMGR PSMODE(ENABLED)


	BFGCM0243I: A file has been created that contains the MQSC definitions for your coordination queue manager. The file can be found here: '/var/mqm/mqft/config/MQ01CRD/MQ01CRD.mqsc'.




13.- Ejecutamos el siguiente comando para crear el Commander::

	$ fteSetupCommands -connectionQMgr MQ01CMM -connectionQMgrHost 192.168.1.110 -connectionQMgrPort 1416 -connectionQMgrChannel SYSTEM.DEF.SVRCONN

Ejecucion y salida del comando anterior::

	$ fteSetupCommands -connectionQMgr MQ01CMM -connectionQMgrHost 192.168.1.110 -connectionQMgrPort 1416 -connectionQMgrChannel SYSTEM.DEF.SVRCONN
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCL0245I: The file '/var/mqm/mqft/config/MQ01CRD/command.properties' has been created successfully.

Ejecutamos el siguiente comando para crear el agente:: 

	$ fteCreateAgent -agentName SRVPRAGN.AG -agentQMgr SRVPRAGN -agentQMgrHost 192.168.1.110 -agentQMgrPort 1418 -agentQMgrChannel SYSTEM.DEF.SVRCONN -agentDesc "Agent Principal SRVPRAGN"

Ejecucion y salida del comando anterior::

	$ fteCreateAgent -agentName SRVPRAGN.AG -agentQMgr SRVPRAGN -agentQMgrHost 192.168.1.110 -agentQMgrPort 1418 -agentQMgrChannel SYSTEM.DEF.SVRCONN -agentDesc "Agent Principal SRVPRAGN"
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCM0238I: Direct the following MQSC definitions for agent 'SRVPRAGN.AG' to queue manager 'SRVPRAGN'.

	DEFINE QLOCAL(SYSTEM.FTE.COMMAND.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(5000) +
	 MAXMSGL(4194304) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.DATA.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(5000) +
	 MAXMSGL(4194304) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.REPLY.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(5000) +
	 MAXMSGL(4194304) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.STATE.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(5000) +
	 MAXMSGL(4194304) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.EVENT.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(5000) +
	 MAXMSGL(4194304) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +.AG. The file can be found here: '/var/mqm/mqft/config/MQ01CRD/agents/SRVPRAGN.AG/SRVPRAGN.AG_delete.mqsc'.
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.

	BFGMQ1024I: The coordination queue manager cannot be contacted or has refused a connection attempt. The IBM MQ reason code was 2538 and diagnostic message code was AMQ9213. The agent's presence will not be published.
	BFGCL0254I: Agent configured successfully. The agent has not been registered with the coordination queue manager.
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHAGT1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHTRN1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHOPS1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHSCH1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHMON1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE
	DEFINE QLOCAL(SYSTEM.FTE.AUTHADM1.SRVPRAGN.AG) +
	 DEFPRTY(0) +
	 DEFSOPT(SHARED) +
	 GET(ENABLED) +
	 MAXDEPTH(0) +
	 MAXMSGL(0) +
	 MSGDLVSQ(PRIORITY) +
	 PUT(ENABLED) +
	 RETINTVL(999999999) +
	 SHARE +
	 NOTRIGGER +
	 USAGE(NORMAL) +
	 REPLACE


	BFGCM0239I: A file has been created containing the MQSC definitions to define the agent SRVPRAGN.AG. The file can be found here: '/var/mqm/mqft/config/MQ01CRD/agents/SRVPRAGN.AG/SRVPRAGN.AG_create.mqsc'.
	BFGCM0241I: A file has been created containing the MQSC definitions to delete the agent SRVPRAGN.AG. The file can be found here: '/var/mqm/mqft/config/MQ01CRD/agents/SRVPRAGN.AG/SRVPRAGN.AG_delete.mqsc'.
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.

	BFGMQ1024I: The coordination queue manager cannot be contacted or has refused a connection attempt. The IBM MQ reason code was 2538 and diagnostic message code was AMQ9213. The agent's presence will not be published.
	BFGCL0254I: Agent configured successfully. The agent has not been registered with the coordination queue manager.


14.- Iniciamos el agente con el comando::

	$ fteStartAgent SRVPRAGN.AG

Ejecución y salida del comando anterior::

	$ fteStartAgent SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCL0030I: The request to start agent 'SRVPRAGN.AG' on this machine has been submitted.
	BFGCL0031I: Agent log files located at: /var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs

15.- Detener el agente con el comando::

	$ fteStopAgent SRVPRAGN.AG

Ejecución y salida del comando anterior::

	$ fteStopAgent SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.
	BFGCL0468I: Issuing stop request to agent 'SRVPRAGN.AG'. The command will wait for the agent to stop. The agent will stop only when all current transfers have completed.
	BFGCL0553I: The agent has processed the stop request and will end when all current transfers have completed.

16.- Eliminar el agente con el comando::

	$ fteDeleteAgent SRVPRAGN.AG

Ejecución y salida del comando anterior::

	$ fteStopAgent SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.
	BFGCL0468I: Issuing stop request to agent 'SRVPRAGN.AG'. The command will wait for the agent to stop. The agent will stop only when all current transfers have completed.
	BFGCL0553I: The agent has processed the stop request and will end when all current transfers have completed.
	[mqm@SRVPRAGN ~]$ 
	[mqm@SRVPRAGN ~]$ 
	[mqm@SRVPRAGN ~]$ 
	[mqm@SRVPRAGN ~]$ 
	[mqm@SRVPRAGN ~]$ fteDeleteAgent SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.


17.- Comprobamos conexión con el siguiente comando::

	$ netstat -nat | grep 1418

Y en el Server de MQ debemos ver las conexiones establecidas.




