REM shutdown all auxiliary apps
taskkill /im pwi3.exe
taskkill /im phd2.exe
taskkill /im astrophysicscommandcenter.exe

timeout -t 15 /nobreak

REM We operate the web power switch here because the ASCOM driver isn't reliable
curl -u admin:melotte15 http://192.168.109.3/outlet?4=OFF
curl -u admin:melotte15 http://192.168.109.3/outlet?5=OFF
curl -u admin:melotte15 http://192.168.109.3/outlet?6=OFF