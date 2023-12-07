Crear Qmanager
=================

Crear un Qmanager en el servidor de MQ::

	1) Conectar al servidor MQ MFT.
	2) Hacer inicio de sesión con el usuario mqm.
	3) Ir a la ruta: /usr/local/bin
	4) editar el archivo agents.lst
		4.1) Todas las lineas deben estar comentadas.
		4.2) Identificar el nombre del Qmanager a crear y respetar la nomenclatura.
		4.3) Identificar el puerto que este libre a utilizar para el Qmanager (dspmq -all |grep PORT|awk '{print $4}'|awk -F"(" '{print $2}'|tr -d ")"|sort)
		4.4) Agregar la linea correspondiente del Qmanager que se va a crear.
	5) Ejecutar el script crear-Qmanager.sh
	6) Consultar que se haya creado el Qmanager (dspmq)
	7) Consultar que el puerto asociado al Qmanager esté en escucha. (dspmq -all)
	8) Consultar que se hayan creado los canales "./display-channel.sh nombre_Qmanager" o directamente en el MQ explorer.
	9) Iniciar los canales desde el MQ explorer o de la consola (primero los emisores y luego los receptores). 
		9.1) Desde consola con el comando ./start-channel.sh "nombre del canal" y me va a arrojar un error cuando lo ejecute la primera vez pero los inicia. Cuando lo vuelva a correr salen arriba. (Cabe destacar que solo levanta los emisores y se deben levantar los receptores preferiblemente desde el MQ Explorer)
