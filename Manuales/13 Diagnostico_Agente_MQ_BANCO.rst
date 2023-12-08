¿Como hacer un Diagnostico del Agente de BANCO?
============================

Ingresar al servidor de MQ y hacer inicio de sesión con el usuario mqm::

	[root@BAN01AGN ~]# sudo su - mqm
	Last login: Thu Dec  7 14:11:24 -04 2023 on tty1
	[mqm@BAN01AGN ~]$

	
Verificar que el agente este en iniciado::

	[mqm@BAN01AGN ~]$ ps -ef | grep mqm
	root        1355    1333  0 16:26 pts/0    00:00:00 sudo su - mqm
	root        1356    1355  0 16:26 pts/0    00:00:00 su - mqm
	mqm         1357    1356  0 16:26 pts/0    00:00:00 -bash
	mqm         1403    1357  0 17:03 pts/0    00:00:00 ps -ef
	mqm         1404    1357  0 17:03 pts/0    00:00:00 grep --color=auto mqm
	[mqm@BAN01AGN ~]$


Iniciamos el agente MQ::

[mqm@BAN01AGN ~]$ /opt/mqm/bin/fteStartAgent BAN01AGN.AG
5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
BFGCL0030I: The request to start agent 'BAN01AGN.AG' on this machine has been submitted.
BFGCL0031I: Agent log files located at: /var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs



Consultamos nuevamente el servicio::

	[mqm@BAN01AGN ~]$ ps -ef | grep mqm
	root        1355    1333  0 16:26 pts/0    00:00:00 sudo su - mqm
	root        1356    1355  0 16:26 pts/0    00:00:00 su - mqm
	mqm         1357    1356  0 16:26 pts/0    00:00:00 -bash
	mqm         1566       1  0 17:11 pts/0    00:00:00 /bin/sh -c /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG -properties=/var/mqm/mqft/config/MQ01CRD/agents/BAN01AGN.AG/agent.properties -appId=BAN01AGN.AG@BAN01AGN /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.tools.attach.enable=no -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=BAN01AGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I:" "The" "request" "to" "start" "agent" "\'BAN01AGN.AG\'" "on" "this" "machine" "has" "been" "submitted. >/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs/stdout.log 2>/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs/stderr.log
	mqm         1567    1566  0 17:11 ?        00:00:00 /opt/mqm/mqft/lib64/mqmftpc -directory=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG -properties=/var/mqm/mqft/config/MQ01CRD/agents/BAN01AGN.AG/agent.properties -appId=BAN01AGN.AG@BAN01AGN /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.tools.attach.enable=no -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=BAN01AGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I: The request to start agent 'BAN01AGN.AG' on this machine has been submitted.
	mqm         1569    1567  3 17:11 ?        00:00:01 /opt/mqm/java/jre64/jre/bin/java -Dcom.ibm.wmqfte.native.pc.processid=1567 -Dcom.ibm.wmqfte.ipc.service.name=PCBAN01AGN.AG@BAN01AGN -Dcom.ibm.wmqfte.native.pc.lockFileName=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/mqmftpc.lck -Dcom.ibm.tools.attach.enable=no -Dwmqfte.lock.file=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/agent.lck -Dcom.ibm.wmqfte.agent.name=BAN01AGN.AG -Dcom.ibm.wmqfte.coord.name=MQ01CRD -Dcom.ibm.wmqfte.product.root=/opt/mqm/mqft -Dcom.ibm.msg.client.commonservices.log.outputName=/var/mqm/mqft/logs/MQ01CRD/agents/BAN01AGN.AG/logs/mqclient.log com.ibm.wmqfte.agent.bootstrap.impl.BootstrapMain com.ibm.wmqfte.agent.Agent -m BFGCL0030I: The request to start agent 'BAN01AGN.AG' on this machine has been submitted.
	mqm         1613    1357  0 17:12 pts/0    00:00:00 ps -ef
	mqm         1614    1357  0 17:12 pts/0    00:00:00 grep --color=auto mqm
	[mqm@BAN01AGN ~]$

	
Consultamos que el agente haya establecido conexión con el servidor de MQ y debemo ver que tenga una conexión establecida por el puerto 1420::

	[mqm@BAN01AGN ~]$ netstat -nat | grep -i esta
	Active Internet connections (servers and established)
	tcp        0     40 192.168.0.8:22          192.168.0.1:58447       ESTABLISHED
	tcp6       0      0 192.168.0.8:41325       192.168.0.3:1420        ESTABLISHED
	[mqm@BAN01AGN ~]$


Desde el Servidor de MQ, podemos consultar que el agente establecio conexión a nivel de SO y debemos ver la conexión por el puerto 1420:

	[mqm@mq-server ~]$ netstat -nat | grep -i 1420
	tcp        0      0 0.0.0.0:1420            0.0.0.0:*               LISTEN
	tcp        0      0 192.168.0.3:53602       192.168.0.3:1420        ESTABLISHED
	tcp        0      0 192.168.0.3:53614       192.168.0.3:1420        ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53596       ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53602       ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.3:53614       ESTABLISHED
	tcp        0      0 192.168.0.3:1420        192.168.0.8:41325       ESTABLISHED
	tcp        0      0 192.168.0.3:53596       192.168.0.3:1420        ESTABLISHED
	[mqm@mq-server ~]$

	
Desde el Servidor de MQ, podemos verificar la conectividad, el cual nos da garantia al 100%::

	[mqm@mq-server ~]$ ftePingAgent -w 15 -m BAN01AGN BAN01AGN.AG
	5724-H72 Copyright IBM Corp.  2008, 2018.  ALL RIGHTS RESERVED
	BFGPR0127W: No credentials file has been specified to connect to IBM MQ. Therefore, the assumption is that IBM MQ authentication has been disabled.
	BFGCL0212I: Issuing ping request to agent BAN01AGN.AG
	BFGCL0213I: agent BAN01AGN.AG responded to ping in 0.078 seconds.
	[mqm@mq-server ~]$




