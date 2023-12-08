¿Como hacer un Diagnostico del Agente de ORIONIS?
============================

Ingresar al servidor de MQ y hacer inicio de sesión con el usuario mqm::

	[root@SRVPRAGN ~]# sudo su - mqm
	Last login: Thu Dec  7 14:10:28 -04 2023 on tty1
	Profile
	[mqm@SRVPRAGN ~]$
	
Verificar que el agente este en iniciado::

	[mqm@SRVPRAGN ~]$ ps -ef | grep mqm
	[mqm@SRVPRAGN ~]$

Iniciamos el agente MQ::

	[mqm@SRVPRAGN ~]$ /opt/mqm/bin/fteStartAgent SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGCL0030I: The request to start agent 'SRVPRAGN.AG' on this machine has been submitted.
	BFGCL0031I: Agent log files located at: /var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs
	[mqm@SRVPRAGN ~]$


Consultamos nuevamente el servicio::

	[mqm@SRVPRAGN ~]$ ps -ef | grep mqm
	root        1357    1334  0 16:27 pts/0    00:00:00 sudo su - mqm
	root        1358    1357  0 16:27 pts/0    00:00:00 su - mqm
	mqm         1359    1358  0 16:27 pts/0    00:00:00 -bash
	mqm         1428       1  0 16:48 pts/0    00:00:00 /bin/sh -c /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG -properties=/var/mqm/mqft/config/MQ01CRD/agents/SRVPRAGN.AG/agent.properties -appId=SRVPRAGN.AG@SRVPRAGN /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.tools.attach.enable=no -Xmx1000M -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=SRVPRAGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I:" "The" "request" "to" "start" "agent" "\'SRVPRAGN.AG\'" "on" "this" "machine" "has" "been" "submitted. >/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs/stdout.log 2>/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs/stderr.log
	mqm         1429    1428  0 16:48 ?        00:00:00 /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG -properties=/var/mqm/mqft/config/MQ01CRD/agents/SRVPRAGN.AG/agent.properties -appId=SRVPRAGN.AG@SRVPRAGN /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.tools.attach.enable=no -Xmx1000M -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=SRVPRAGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I: The request to start agent 'SRVPRAGN.AG' on this machine has been submitted.
	mqm         1431    1429  2 16:48 ?        00:00:02 /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.wmqfte.native.pc.processid=1429 -Dcom.ibm.wmqfte.ipc.service.name=PCSRVPRAGN.AG@SRVPRAGN -Dcom.ibm.wmqfte.native.pc.lockFileName=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/mqmftpc.lck -Dcom.ibm.tools.attach.enable=no -Xmx1000M -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=SRVPRAGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/SRVPRAGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I: The request to start agent 'SRVPRAGN.AG' on this machine has been submitted.
	mqm         1478    1359  0 16:49 pts/0    00:00:00 ps -ef
	mqm         1479    1359  0 16:49 pts/0    00:00:00 grep --color=auto mqm
	
Consultamos que el agente haya establecido conexión con el servidor de MQ y debemo ver que tenga una conexión establecida por el puerto 1418::

	[mqm@SRVPRAGN ~]$ netstat -nat | grep -i esta
	Active Internet connections (servers and established)
	tcp        0     56 192.168.0.9:22          192.168.0.1:58449       ESTABLISHED
	tcp6       0      0 192.168.0.9:39971       192.168.0.3:1418        ESTABLISHED
	[mqm@SRVPRAGN ~]$

Desde el Servidor de MQ, podemos consultar que el agente establecio conexión a nivel de SO y debemos ver la conexión por el puerto 1420:

	[mqm@mq-server ~]$ netstat -nat | grep -i 1420
	tcp        0      0 0.0.0.0:1420            0.0.0.0:*               LISTEN
	tcp        0      0 192.168.0.3:53602       192.168.0.3:1420        ESTABLISHED
	tcp        0      0 192.168.0.3:53614       192.168.0.3:1420        ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53596       ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53602       ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53614       ESTABLISHED
	tcp        0      0 192.168.0.3:53596       192.168.0.3:1420        ESTABLISHED
	[mqm@mq-server ~]$
	
Desde el Servidor de MQ, podemos verificar la conectividad, el cual nos da garantia al 100%::

	[mqm@mq-server FILELOGGER1]$ ftePingAgent -w 15 -m SRVPRAGN SRVPRAGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.
	BFGCL0212I: Issuing ping request to agent SRVPRAGN.AG
	BFGCL0213I: agent SRVPRAGN.AG responded to ping in 0.078 seconds.



