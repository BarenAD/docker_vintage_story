![Static Badge](https://img.shields.io/badge/powered-BarenAD-BarenAD)
![GitHub top language](https://img.shields.io/github/languages/top/BarenAD/docker_vintage_story)
![GitHub Repo stars](https://img.shields.io/github/stars/BarenAD/docker_vintage_story)
![GitHub issues](https://img.shields.io/github/issues/BarenAD/docker_vintage_story)
![Logotype](./src/assets/git/vs_logo.png)

# min support version 1.18.8

# DOCUMENTATION
Choose needed branch on git. (any - all versions, manual install server, check only `.NET` version) or (specific version, automatically install)

## BASE PARAMS
1) Count backups: 5. For change - edit enviroment vairable `VS_BACKUPS_AGE_LIMIT` in container
2) Frequency backups: every day 00:00. For change - edit enviroment vairable `VS_BACKUP_PERIODICITY` in container

## REQUIREMENTS
1) [Docker](https://docs.docker.com/engine/install)
2) [VSC manager](https://github.com/BarenAD/docker_vintage_story/tree/vsc_manager) (optional)

## QUICK STARTING
1) Run `vsc_manager container_install`
2) Run `vsc_manager server_update`
3) Run `vsc_manager container_restart`
4) Done! Now you can connect to the server. Or make the settings and install the necessary mods.

## QUICK STARTING MANUAL
1) Run `sudo docker run -d --name vintage_story_server -p 42420:42420 --restart=unless-stopped -e TZ=Asia/Novosibirsk -v vintage_story_server:/var/vintage_story barenad/vintage_story_server:any_net_7` (change to suit yourself: -p - server port, -e - TimeZone, see `/etc/timezone`)
2) If you first time run command then run `sudo docker exec -it vintage_story_server vs_server_update <?full_url_download_server_archive_tar>"` ATTENTION! replace [full_url_download_server_archive_tar](https://account.vintagestory.at/) to choose needed version game server url (Linux tar.gz server only) (expand `(Show all available downloads and mirrors of Vintage Story)` right mouse button and copy the url link)
3) Run `sudo docker restart vintage_story_server`
4) Done! Now you can connect to the server. Or make the settings and install the necessary mods.

## HOW UPDATED MANUAL
1) Run `su -`
2) Run `cd /var/lib/docker/volumes/vintage_story/_data/server`
3) Run `wget -O server.tar.gz [PASTE_DOWNLOAD_URL]` or download and move archive manual (For example: scp)
4) Run `tar -xzf server.tar.gz`
5) Run `chmod +x ./server.sh`
6) Change `server.sh` parameters: `VSPATH='/var/vintage_story/server'`, `DATAPATH='/var/vintage_story/data'`

## LINK TO VOLUMES
To simplify access to the server folders, you can create a link directly from the root directory of the user
1) Run `sudo ln -s /var/lib/docker/volumes /root/docker_volumes`
2) Done! Now you can replace all paths `/var/lib/docker/volumes` -> `~/docker_volumes` (root user)

## GO TO SERVER PATH
1) Run `su -` (change to root user)
2) Run `cd /var/lib/docker/volumes/vintage_story_server/_data`
3) `server` - server directory, `data` - server data directory

## QUICK INSTALL MODS
1) Run `vsc_manager server_mod_install`

## INSTALL MODS MANUAL
1) Run `sudo docker exec -it vintage_story_server bash`
2) Run `cd /var/vintage_story/data/Mods`
3) Run `wget --content-disposition <full_url_download_mod>` ATTENTION! replace [full_url_download_server_archive_tar](https://mods.vintagestory.at/list/mod) to choose needed mod (repeat for all mods)
4) Run `exit`
5) Restart container `sudo docker restart vintage_story_server`

## IMMEDIATE BACKUP
1) Run `vsc_manager server_backup`

## IMMEDIATE BACKUP MANUAL
1) Run `sudo docker exec -it vintage_story_server vs_backup`

## WHERE PLACED BACKUPS
1) Run `su -`
2) Run `cd /var/lib/docker/volumes/vintage_story_server/_data/data/Backups`

### HOW TO GET INSIDE CONTAINER
1) Run `vsc_manager container_attach`

### HOW TO GET INSIDE CONTAINER MANUAL
1) Run `sudo docker exec -it vintage_story_server bash`

### HOW EXTRACT BACKUP ARCHIVE
1) Rename needed archive (remove all ':' from name)
2) Run `tar -xvzf archive_name.tar.gz`

# DEVELOPMENT

## HOW STARTED
1) Pull or download repository
2) Run `build.sh`
3) Run `start.sh`
4) If you first started then run `update_server.sh <full_url_download_server_archive_tar>` ATTENTION! replace [full_url_download_server_archive_tar](https://account.vintagestory.at/) to choose needed version game server url (Linux tar.gz server only) (expand `(Show all available downloads and mirrors of Vintage Story)` right mouse button and copy the url link)

### HOW TO GET INSIDE CONTAINER
1) Run `attach.sh`

#### CONVENIENT MANAGER AND EDITOR
1) [MC](https://midnight-commander.org/)
