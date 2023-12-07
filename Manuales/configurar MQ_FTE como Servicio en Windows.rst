

El servicio no funcion se debe bajar.

Abrir un powershell elvevado como administrador.
g:

G:\MQ\bin

 .\fteStartAgent.cmd OTRO01AGN.AG
 
  
  .\fteStopAgent.cmd OTRO01AGN.AG
  
Abrir un CMD elevado como Administrador.
  sc delete "MQ_Installation1"

  
  
Si el servicio no funciona:

Detener agente::

  .\fteStopAgent.cmd OTRO01AGN.AG
  
Abrir un CMD elevado como Administrador::
	
	sc delete "MQ_Installation1"

Crear nuevamente el agente::

  fteModifyAgent.cmd -agentName OTRO01AGN.AG -s –su MUSR_MQADMIN –sp  P44sw00rd*.21
