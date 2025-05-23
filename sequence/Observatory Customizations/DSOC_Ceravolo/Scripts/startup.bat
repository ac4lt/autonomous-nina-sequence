REM The Web Power Switch ASCOM driver on the Ceravolo likes to give timeout messages
REM and while they are benign, it also sometimes just fails for not apparent reason.
REM Instead, we control it from the command line

curl -u admin:melotte15 http://192.168.0.101:370/outlet?3=ON
curl -u admin:melotte15 http://192.168.0.101:370/outlet?4=ON
curl -u admin:melotte15 http://192.168.0.101:370/outlet?7=ON
