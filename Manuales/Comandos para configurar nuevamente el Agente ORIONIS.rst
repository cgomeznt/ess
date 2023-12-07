Comandos para configurar nuevamente el Agente
=============================================


Estos comandos permite configurar nuevamente el Agente de ORIONIS::



	./fteSetupCoordination -f -coordinationQMgr MQ01CRD -coordinationQMgrHost 10.97.0.14 -coordinationQMgrPort 1414 -coordinationQMgrChannel SYSTEM.DEF.SVRCONN

	./fteSetupCommands -f -connectionQMgr MQ01CMM -connectionQMgrHost 10.97.0.14 -connectionQMgrPort 1416 -connectionQMgrChannel SYSTEM.DEF.SVRCONN

	./fteCreateAgent -f -agentName SRVPRAGN.AG -agentQMgr SRVPRAGN -agentQMgrHost 10.97.0.14 -agentQMgrPort 1418 -agentQMgrChannel SYSTEM.DEF.SVRCONN -agentDesc "AGENT_PRINCIPAL"

	
Deben utilizar la IP que le corresponde al Servidor de MQ ORIONIS.