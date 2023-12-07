Iniciar todos los servicios de MQ MFT
====================================

Cuando se reinicia un servidor de MQ debemos hacer lo siguiente.


Asegurar que el Firewall este abajo o que se tenga los permisos de los puertos.
	
Iniciar con el usuario de mqm::

	sudo su - mqm

Consultar los Qmanager y veremos que todos estan abajo::

	[mqm]:/var/mqm>dspmq
	
	QMNAME(MQ01CRD)                                           STATUS(Ended unexpectedly)
	QMNAME(MQ01CMM)                                           STATUS(Ended unexpectedly)
	QMNAME(SRVPRAGN)                                          STATUS(Ended unexpectedly)
	QMNAME(BAN01AGN)                                          STATUS(Ended unexpectedly)



Nos cambiamos a la ruta en donde están todos los script administrativos::

	[mqm]:/var/mqm>cd /usr/local/bin/
	[mqm]:/usr/local/bin>


Para Iniciar un solo Qmanager es::

	/usr/local/bin>./start-qmanager-all.sh
	
Consultar los Qmanager::

	$ dspmq
	QMNAME(MQ01CRD)                                           STATUS(Running)
	QMNAME(MQ01CMM)                                           STATUS(Running)
	QMNAME(SRVPRAGN)                                          STATUS(Running)
	QMNAME(BAN01AGN)                                          STATUS(Running)

Por ultimoa iniciamos los canales::

	/usr/local/bin>./start-chanell-all.sh

