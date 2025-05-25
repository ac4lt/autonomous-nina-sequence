REM shutdown all auxiliary apps
taskkill /im phd2.exe

REM turn off power
curl -u admin:melotte15 http://192.168.0.51:365/outlet?5=OFF
curl -u admin:melotte15 http://192.168.0.51:365/outlet?6=OFF
curl -u admin:melotte15 http://192.168.0.51:365/outlet?7=OFF
curl -u admin:melotte15 http://192.168.0.51:365/outlet?8=OFF
