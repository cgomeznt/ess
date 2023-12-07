Habilitar puertos del firewalld
=======================

Permitir en el firewalld los puertos::

Comandos para habilitar los puertos en el Firewall::

	firewall-cmd --permanent --zone=public --add-port=1414/tcp \
	firewall-cmd --permanent --zone=public --add-port=1416/tcp \
	firewall-cmd --permanent --zone=public --add-port=1418/tcp \
	firewall-cmd --permanent --zone=public --add-port=1420/tcp \
	firewall-cmd --reload
	firewall-cmd --list-all