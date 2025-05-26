SETLOCAL EnableExtensions

REM The Web Power Switch ASCOM driver on the Ceravolo likes to give timeout messages
REM and while they are benign, it also sometimes just fails for not apparent reason.
REM Instead, we control it from the command line

curl -u admin:melotte15 http://192.168.0.51:365/outlet?5=ON
curl -u admin:melotte15 http://192.168.0.51:365/outlet?6=ON
curl -u admin:melotte15 http://192.168.0.51:365/outlet?7=ON
curl -u admin:melotte15 http://192.168.0.51:365/outlet?8=ON

REM send a wake-on-lan packet to the 10 Micron mount to boot it.
"C:\Wake On Lan\wol.exe" 00-C0-08-8C-66-FB

REM waste a bunch of time pinging the mount to give it time to boot and we can at least see something happening
REM ping -n 120 192.168.0.52	

REM Wait 5 seconds for the USB devices to wake up and connect to the PC
timeout -t 120 /nobreak
