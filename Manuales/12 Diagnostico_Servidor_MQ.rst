¿Como hacer un Diagnostico?
============================

Garantizar que tengan habilitar los puertos en el Firewall::

	firewall-cmd --permanent --zone=public --add-port=1414/tcp \
	firewall-cmd --permanent --zone=public --add-port=1416/tcp \
	firewall-cmd --permanent --zone=public --add-port=1418/tcp \
	firewall-cmd --permanent --zone=public --add-port=1420/tcp \
	firewall-cmd --reload
	firewall-cmd --list-all
	
Puertos y nombre de los QMnager que tiene configurado ORIONIS::

	1414	MQ01CRD
	1416	MQ01CMM
	1418	SRVPRAGN
	1420	BAN01AGN

Ingresar al servidor de MQ y hacer inicio de sesión con el usuario mqm::

	# sudo su - mqm
	Last login: Thu Dec  7 14:07:27 -04 2023 on pts/0
	COORDINATOR_PORT=1414
	COORDINATOR=MQ01CRD
	SRVPR_CLIENT_PORT=1418
	MQ_JAVA_DATA_PATH=/var/mqm
	MQ_INSTALLATION_PATH=/opt/mqm
	MQ_ENV_MODE=64
	COMMANDER=MQ01CMM
	MQ_DATA_PATH=/var/mqm
	SRVPR_CLIENT=SRVPRAGN
	MQ_JRE_PATH=/opt/mqm/java/jre64/jre
	MQ_JAVA_INSTALL_PATH=/opt/mqm/java
	COMMANDER_PORT=1416
	MQ_JAVA_LIB_PATH=/opt/mqm/java/lib64
	MQ_INSTALLATION_NAME=Installation1
	[mqm@mq-server ~]$

Ejecutar el comando dspmq para ver el estado de los QMnager::

	$ dspmq
	QMNAME(MQ01CRD)                                           STATUS(Ended unexpectedly)
	QMNAME(MQ01CMM)                                           STATUS(Ended unexpectedly)
	QMNAME(SRVPRAGN)                                          STATUS(Ended unexpectedly)
	QMNAME(BAN01AGN)                                          STATUS(Ended unexpectedly)
	[mqm@mq-server ~]$
	
Si el STATUS indica que estan en "Ended unexpectedly" debemos iniciar los QMnager e iniciar los Channel::

	[mqm@mq-server ~]$ cd /usr/local/bin/
	[mqm@mq-server bin]$
	
	[mqm@mq-server bin]$ ./start-qmanager-all.sh
	IBM MQ queue manager 'MQ01CRD' starting.
	The queue manager is associated with installation 'Installation1'.
	86 log records accessed on queue manager 'MQ01CRD' during the log replay phase.
	Log replay for queue manager 'MQ01CRD' complete.
	Transaction manager state recovered for queue manager 'MQ01CRD'.
	IBM MQ queue manager 'MQ01CRD' started using V9.1.0.0.
	Qmanager was started successfully

	Staring Channels
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CRD.


		 1 : START CHANNEL(MQ01CRD.A.BAN01AGN)
	AMQ9514E: Channel 'MQ01CRD.A.BAN01AGN' is in use.
	One MQSC command read.
	No commands have a syntax error.
	One valid MQSC command could not be processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CRD.


		 1 : START CHANNEL(MQ01CRD.A.MQ01CMM)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CRD.


		 1 : START CHANNEL(MQ01CRD.A.SRVPRAGN)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	IBM MQ queue manager 'MQ01CMM' starting.
	The queue manager is associated with installation 'Installation1'.
	11 log records accessed on queue manager 'MQ01CMM' during the log replay phase.
	Log replay for queue manager 'MQ01CMM' complete.
	Transaction manager state recovered for queue manager 'MQ01CMM'.
	IBM MQ queue manager 'MQ01CMM' started using V9.1.0.0.
	Qmanager was started successfully

	Staring Channels
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CMM.


		 1 : START CHANNEL(MQ01CMM.A.BAN01AGN)
	AMQ9514E: Channel 'MQ01CMM.A.BAN01AGN' is in use.
	One MQSC command read.
	No commands have a syntax error.
	One valid MQSC command could not be processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CMM.


		 1 : START CHANNEL(MQ01CMM.A.MQ01CRD)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager MQ01CMM.


		 1 : START CHANNEL(MQ01CMM.A.SRVPRAGN)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	IBM MQ queue manager 'SRVPRAGN' starting.
	The queue manager is associated with installation 'Installation1'.
	121 log records accessed on queue manager 'SRVPRAGN' during the log replay phase.
	Log replay for queue manager 'SRVPRAGN' complete.
	Transaction manager state recovered for queue manager 'SRVPRAGN'.
	IBM MQ queue manager 'SRVPRAGN' started using V9.1.0.0.
	Qmanager was started successfully

	Staring Channels
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager SRVPRAGN.


		 1 : START CHANNEL(SRVPRAGN.A.BAN01AGN)
	AMQ9514E: Channel 'SRVPRAGN.A.BAN01AGN' is in use.
	One MQSC command read.
	No commands have a syntax error.
	One valid MQSC command could not be processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager SRVPRAGN.


		 1 : START CHANNEL(SRVPRAGN.A.MQ01CMM)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager SRVPRAGN.


		 1 : START CHANNEL(SRVPRAGN.A.MQ01CRD)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	IBM MQ queue manager 'BAN01AGN' starting.
	The queue manager is associated with installation 'Installation1'.
	34 log records accessed on queue manager 'BAN01AGN' during the log replay phase.
	Log replay for queue manager 'BAN01AGN' complete.
	Transaction manager state recovered for queue manager 'BAN01AGN'.
	IBM MQ queue manager 'BAN01AGN' started using V9.1.0.0.
	Qmanager was started successfully

	Staring Channels
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager BAN01AGN.


		 1 : START CHANNEL(BAN01AGN.A.MQ01CMM)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager BAN01AGN.


		 1 : START CHANNEL(BAN01AGN.A.MQ01CRD)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	5724-H72 (C) Copyright IBM Corp. 1994, 2018.
	Starting MQSC for queue manager BAN01AGN.


		 1 : START CHANNEL(BAN01AGN.A.SRVPRAGN)
	AMQ8018I: Start IBM MQ channel accepted.
	One MQSC command read.
	No commands have a syntax error.
	All valid MQSC commands were processed.
	[mqm@mq-server bin]$
	
Iniciamos los Channel::

	[mqm@mq-server bin]$ ./start-channel-all.sh

	QMANAGER: MQ01CRD
			Starting Channel -> MQ01CRD.A.BAN01AGN  [ OK ]
			Starting Channel -> MQ01CRD.A.MQ01CMM   [ OK ]
			Starting Channel -> MQ01CRD.A.SRVPRAGN  [ OK ]


	QMANAGER: MQ01CMM
			Starting Channel -> MQ01CMM.A.BAN01AGN  [ OK ]
			Starting Channel -> MQ01CMM.A.MQ01CRD   [ OK ]
			Starting Channel -> MQ01CMM.A.SRVPRAGN  [ OK ]


	QMANAGER: SRVPRAGN
			Starting Channel -> SRVPRAGN.A.BAN01AGN         [ OK ]
			Starting Channel -> SRVPRAGN.A.MQ01CMM  [ OK ]
			Starting Channel -> SRVPRAGN.A.MQ01CRD  [ OK ]


	QMANAGER: BAN01AGN
			Starting Channel -> BAN01AGN.A.MQ01CMM  [ OK ]
			Starting Channel -> BAN01AGN.A.MQ01CRD  [ OK ]
			Starting Channel -> BAN01AGN.A.SRVPRAGN         [ OK ]

	[mqm@mq-server bin]$
	
Verificamos que los servicios levantaran los puertos, 1414, 1416, 1418 y 1420::

	[mqm@mq-server bin]$ netstat -nat | grep -i listen
	tcp        0      0 0.0.0.0:1418            0.0.0.0:*               LISTEN
	tcp        0      0 0.0.0.0:1416            0.0.0.0:*               LISTEN
	tcp        0      0 0.0.0.0:1420            0.0.0.0:*               LISTEN
	tcp        0      0 0.0.0.0:1414            0.0.0.0:*               LISTEN
	tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
	tcp        0      0 127.0.0.1:6010          0.0.0.0:*               LISTEN
	[mqm@mq-server bin]$

Consultamos que este iniciado el Logger de MQ::

	[mqm@mq-server bin]$ ps -ef | grep logger
	mqm         2696    1366  0 16:39 pts/0    00:00:00 grep --color=auto logger
	[mqm@mq-server bin]$

Si no esta iniciado, procedemos a iniciar el servicio::

	[mqm@mq-server bin]$ fteStartLogger filelogger1
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCL0287I: The request to start the logger on this machine has been submitted.
	BFGCL0526I: Logger log files located at: /var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1/logs
	[mqm@mq-server bin]$

Consultamos nuevamente el servicio de Logger::

	[mqm@mq-server bin]$ ps -ef | grep logger
	mqm         2738       1  0 16:40 pts/0    00:00:00 /bin/sh -c /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1 -properties=/var/mqm/mqft/config/MQ01CRD/loggers/FILELOGGER1/logger.properties -appId=FILELOGGER1@MQ01CRD /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.wmqfte.logger.name=FILELOGGER1 -Dcom.ibm.wmqfte.product.logging=/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1 -Dcom.ibm.wmqfte.coordination.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.tools.attach.enable=no -Dcom.ibm.wmqfte.excludeListFilename=config/databaseLoggerJarList.properties -Dcom.ibm.tools.attach.enable=no com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.databaselogger.Logger -m BFGCL0287I:" "The" "request" "to" "start" "the" "logger" "on" "this" "machine" "has" "been" "submitted. >/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1/logs/stdout.log 2>/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1/logs/stderr.log
	mqm         2739    2738  0 16:40 ?        00:00:00 /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/logge s/FILELOGGER1 -properties=/var/mqm/mqft/config/MQ01CRD/loggers/FILELOGGER1/logger.properties -appId=FILELOGGER1@MQ01CRD /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.wmqfte.logger.name=FILELOGGER1 -Dcom.ibm.wmqfte.product.logging=/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1 -Dcom.ibm.wmqfte.coordination.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.tools.attach.enable=no -Dcom.ibm.wmqfte.excludeListFilename=config/databaseLoggerJarList.properties -Dcom.ibm.tools.attach.enable=no com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.databaselogger.Logger -m BFGCL0287I: The request to start the logger on this machine has been submitted.
	mqm         2742    2739  4 16:40 ?        00:00:01 /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.wmqfte.native.pc.processid=2739 -Dcom.ibm.wmqfte.ipc.service.name=PCFILELOGGER1@MQ01CRD -Dcom.ibm.wmqfte.native.pc.lockFileName=/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1/mqmftpc.lck -Dcom.ibm.wmqfte.logger.name=FILELOGGER1 -Dcom.ibm.wmqfte.product.logging=/var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1 -Dcom.ibm.wmqfte.coordination.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.tools.attach.enable=no -Dcom.ibm.wmqfte.excludeListFilename=config/databaseLoggerJarList.properties -Dcom.ibm.tools.attach.enable=no com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.databaselogger.Logger -m BFGCL0287I: The request to start the logger on this machine has been submitted.
	mqm         2776    1366  0 16:40 pts/0    00:00:00 grep --color=auto logger
	[mqm@mq-server bin]$
	
Nos vamos a la ruta de los LOG del servidor de MQ::

	[mqm@mq-server ~]$ cd /var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1/
	[mqm@mq-server FILELOGGER1]$

Cosultamos cual es el ultimo archivo de LOG::

	[mqm@mq-server FILELOGGER1]$ ls -ltr
	total 20
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER11-20231026223418259.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER19-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER18-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER17-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER16-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER15-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER14-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER13-20231026223418260.log
	-rw------- 1 mqm mqm    0 Oct 26 22:34 FILELOGGER12-20231026223418260.log
	drwxrwsrwx 2 mqm mqm  128 Dec  7 16:40 logs
	-rw-rw-rw- 1 mqm mqm    4 Dec  7 16:40 mqmftpc.pid
	-rw-rw-r-- 1 mqm mqm    4 Dec  7 16:40 logger.pid
	-rw-rw-r-- 1 mqm mqm    0 Dec  7 16:40 logger.lck
	-rw-rw-rw- 1 mqm mqm    0 Dec  7 16:40 mqmftpc.lck
	-rw------- 1 mqm mqm 9174 Dec  7 16:40 FILELOGGER10-20231026223418259.log
	[mqm@mq-server FILELOGGER1]$
	
Ralizamo una consulta en vivo del LOG, el cual nos va permitir ver si hay transferencia de archivos::

	[mqm@mq-server FILELOGGER1]$ tail -f FILELOGGER10-20231026223418259.log
	2023-10-31T14:49:07;null                                            ;[MACT];0  ;SRVPRAGN_TO_BAN01AGN;SRVPRAGN.AG;SRVPRAGN;start;
	2023-10-31T14:50:11;null                                            ;[MACT];0  ;SRVPRAGN_TO_BAN01AGN;SRVPRAGN.AG;SRVPRAGN;stop;
	2023-10-31T14:58:22;null                                            ;[MACT];0  ;SRVPRAGN_TO_BAN01AGN;SRVPRAGN.AG;SRVPRAGN;start;
	2023-12-07T18:12:01;null                                            ;[MACT];0  ;SRVPRAGN_TO_BAN01AGN;SRVPRAGN.AG;SRVPRAGN;start;
	2023-12-07T18:44:34;414d51204d513031434d4d2020202020f3097265035e0224;[MCRT];ORIONIS_TO_BANCO;SRVPRAGN.AG;SRVPRAGN;create;
	2023-12-07T18:44:34;414d51204d513031434d4d2020202020f3097265035e0224;[MACT];0  ;ORIONIS_TO_BANCO;SRVPRAGN.AG;SRVPRAGN;start;
	2023-12-07T18:44:34;414d5120535256505241474e20202020f409726502083525;[TSTR];   ;SRVPRAGN.AG;SRVPRAGN;STANDARD;BAN01AGN.AG;BAN01AGN;Carlos.Gomez;;;com.ibm.wmqfte.SourceAgent=SRVPRAGN.AG, com.ibm.wmqfte.DestinationAgent=BAN01AGN.AG, com.ibm.wmqfte.MqmdUser=usrmq, com.ibm.wmqfte.OriginatingUser=Carlos.Gomez, com.ibm.wmqfte.OriginatingHost=192.168.100.81, com.ibm.wmqfte.TransferId=414d5120535256505241474e20202020f409726502083525, com.ibm.wmqfte.Priority=0;
	2023-12-07T18:44:34;414d5120535256505241474e20202020f409726502083525;[TPRO];0  ;/intercambio/entrada/ARCHIVO_DE_PRUEBA.TXT;0;file;delete;;;;;;/intercambio/salida/ARCHIVO_DE_PRUEBA.TXT;0;file;overwrite;;;;;;;;
	2023-12-07T18:44:34;414d5120535256505241474e20202020f409726502083525;[TPRO];0  ;/intercambio/entrada/MQCONTROL.TXT;0;file;delete;;;;;;/intercambio/salida/MQCONTROL.TXT;0;file;overwrite;;;;;;;;
	2023-12-07T18:44:34;414d5120535256505241474e20202020f409726502083525;[TCOM];0  ;SRVPRAGN.AG;SRVPRAGN;STANDARD;BAN01AGN.AG;BAN01AGN;STANDARD;Carlos.Gomez;;BFGRP0032I: The file transfer request has successfully completed.;com.ibm.wmqfte.SourceAgent=SRVPRAGN.AG, com.ibm.wmqfte.DestinationAgent=BAN01AGN.AG, com.ibm.wmqfte.MqmdUser=usrmq, com.ibm.wmqfte.OriginatingUser=Carlos.Gomez, com.ibm.wmqfte.OriginatingHost=192.168.100.81, com.ibm.wmqfte.TransferId=414d5120535256505241474e20202020f409726502083525, com.ibm.wmqfte.Priority=0;










