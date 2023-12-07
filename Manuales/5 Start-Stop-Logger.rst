Start Stop el Logger
====================

Detener el Logger::

	[mqm]:/var/mqm>fteStopLogger filelogger1
	5655-MFT, 5724-H72 Copyright IBM Corp.  2008, 2014.  ALL RIGHTS RESERVED
	BFGCL0528I: Issuing stop request to logger 'FILELOGGER1'. The command will wait for the logger to stop.
	BFGCL0529I: Logger 'FILELOGGER1' has been stopped.

Iniciar el Logger::

	[mqm]:/var/mqm>fteStartLogger filelogger1
	5655-MFT, 5724-H72 Copyright IBM Corp.  2008, 2014.  ALL RIGHTS RESERVED
	BFGCL0287I: The request to start the logger on this machine has been submitted.
	BFGCL0526I: Logger log files located at: /var/mqm/mqft/logs/CRC01CRD/loggers/FILELOGGER1/logs
