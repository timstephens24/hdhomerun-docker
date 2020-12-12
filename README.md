HDhomerun DVR: https://forum.silicondust.com/forum/viewtopic.php?f=126&t=20613
HDhomerun DVR Server Version: Latest Beta

This will not update the firmware. Install the Windows/Mac Software and use that to update the firmware (from the link above). Do not install the server when asked, since that's done here in this docker.

### docker-compose
```
version: "3.2"
services:
  hdhomerun:
    restart: unless-stopped
    image: timstephens24/hdhomerun_dvr_beta
    container_name: hdhomerun
    network_mode: host
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/New_York
    volumes:
      - /path/to/hdhomerun/folder:/hdhomerun
      - /etc/localtime:/etc/localtime:ro
```
### docker run
```
docker run -d --name hdhomerun \
  --restart=unless-stopped \
  --network host \
  -e PUID=1000 -e -PGID=1000 \
  -e TZ=America/New_York \
  -v /path/to/hdhomerun/folder:/hdhomerun \
  -v /etc/localtime:/etc/localtime:ro \
  timstephens24/hdhomerun_dvr_beta
```
