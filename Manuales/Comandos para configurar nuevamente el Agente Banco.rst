Comandos para configurar nuevamente el Agente
=============================================


Estos comandos permite configurar nuevamente el Agente de BANCO::



	./fteSetupCoordination -f -coordinationQMgr MQ01CRD -coordinationQMgrHost 172.30.4.230 -coordinationQMgrPort 1414 -coordinationQMgrChannel SYSTEM.DEF.SVRCONN

	./fteSetupCommands -f -connectionQMgr MQ01CMM -connectionQMgrHost 172.30.4.230 -connectionQMgrPort 1416 -connectionQMgrChannel SYSTEM.DEF.SVRCONN

	./fteCreateAgent -f -agentName BAN01AGN.AG -agentQMgr BAN01AGN -agentQMgrHost 172.30.4.230 -agentQMgrPort 1420 -agentQMgrChannel SYSTEM.DEF.SVRCONN -agentDesc "AGENT_BANCO"


Deben utilizar la IP que le corresponde al Servidor de MQ ORIONIS.