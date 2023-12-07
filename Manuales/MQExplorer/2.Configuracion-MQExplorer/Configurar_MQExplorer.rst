Configuarar el MQ MFT Explorer
================================

Nombre del servidor y sus IP::

	srv-vccs-mqf-orionis.credicard.com.ve 
	10.192.168.20


La IP que utilizaremos es la 10.192.168.20

Antes de comenzar debemos tener claro que el MQ MFT trabaja con un::
	
	Coordination Queue Manager
	Commander Queue Manager

Para asociar los Queue Manager.

En Credicard el Coordination Queue Manager es::
	
	MQ01CRD	1414	SYSTEM.DEF.SRVCONN

El Commander Queue Manager es:
	
	MQ01CMM		1416	SYSTEM.DEF.SRVCONN

Y el agent más importante es del AS400 que es:

	SRVPRAGN	1418

Iniciamos sesion en el servidor de MQ y nos cambiamos con el usuario mqm::

	[root@srv-vccs-mqft-orionis]:/home/cgomez>su - mqm
	[mqm@srv-vccs-mqft-orionis]:/var/mqm>


Ver en /usr/local/bin los script para manipulacion::

El comando más utilizado para listar es el dspmq::

	[mqm@srv-vccs-mqft-orionis]:/var/mqm>dspmq ?
	Usage: dspmq [-m QMgrName] [-o status | -s] [-o default]
				 [-o standby] [-o installation] [-x] [-n] [-a]

Listamos todos Queue Manager en el servidor MQ MFT::

	[mqm@srv-vccs-mqf-orionis]:/var/mqm>dspmq -a
	QMNAME(MQ01CRD)                                          STATUS(Running)
	QMNAME(CRC01CMM)                                          STATUS(Running)
	QMNAME(SRVPRAGN)                                          STATUS(Running)
	QMNAME(BAN01AGN)                                          STATUS(Running)
	

Listamos todos los Queue Manager y sus puertos::

	[mqm@srv-vccs-mqf-orionis]:/var/mqm>dspmq -all
	QMNAME(MQ01CRD)                                          STATUS(Running)
		TRPTYPE(TCP) PID(28515) IPADDR() PORT(1414) BACKLOG(100)
	QMNAME(CRC01CMM)                                          STATUS(Running)
		TRPTYPE(TCP) PID(13387) IPADDR() PORT(1416) BACKLOG(100)
	QMNAME(SRVPRAGN)                                          STATUS(Running)
		TRPTYPE(TCP) PID(28709) IPADDR() PORT(1418) BACKLOG(100)
	QMNAME(BAN01AGN)                                          STATUS(Running)
		TRPTYPE(TCP) PID(28814) IPADDR() PORT(1420) BACKLOG(100)
	
	
Ya teniendo en pantalla cuales son los Queue Manager activos podemos iniciar la configuración del MQ Explorer.