#!/bin/sh

if [ ! -f "${APP_DATA}/.config/NzbDrone/config.ini" ]; then
  mkdir -p "${APP_DATA}/.config/NzbDrone"
  cat <<EOF > "${APP_DATA}/.config/NzbDrone/config.xml"
<Config>
  <UrlBase>${SONARR_URLBASE}</UrlBase>
  <LogLevel>Info</LogLevel>
  <LaunchBrowser>False</LaunchBrowser>
</Config>
EOF
  chown -R sonarr:sonarr "${APP_DATA}"
fi

exec /sbin/setuser sonarr /usr/bin/mono /opt/sonarr/NzbDrone.exe --no-browser
