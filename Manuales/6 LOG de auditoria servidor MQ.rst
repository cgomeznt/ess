#### Buscar un log en el servidor MQ ####

1) Se debe ingresar al servidor mq y hacer inicio de sesión con el usuarop mqm.
2) Dirigerse a la ruta /var/mqm/mqft/logs/MQ01CRD/loggers/FILELOGGER1
3) y luego hacer un ls -ltr
4) Ver cual es el log que tiene fecha actual, es decir que todavía esta escribiendo.
5) hacer un grep -i L180105_980_77B (nombre del archivo) FILELOGGER17-20180104024011654.log (log que todavia está escribiendo)

NOTA: Si el log dice un delete quiere decir que fue transferido exitosamente, 
ya que hay una condicion que se elimine en el origen cuando ya se encuentra
en el destino.
