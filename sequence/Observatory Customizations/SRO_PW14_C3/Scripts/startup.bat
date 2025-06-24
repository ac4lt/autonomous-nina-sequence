REM SRO PW14 startup
REM We operate the web power switch here because the ASCOM driver isn't reliable
curl -u admin:melotte15 http://192.168.109.3/outlet?4=ON
curl -u admin:melotte15 http://192.168.109.3/outlet?5=ON
curl -u admin:melotte15 http://192.168.109.3/outlet?6=ON

timeout -t 15 /nobreak