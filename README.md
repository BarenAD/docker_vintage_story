# DOCUMENTATION

## HOW STARTED
1) Choose needle branch on git. (any - all versions, manual install server, check only net version) or (specific version, automatically install)
2) Install docker
3) Pull or download repository
4) Run `build.sh`
5) Run `start.sh`
6) If you first started then go to `HOW UPDATED`

## HOW UPDATED AUTOMATICALLY
1) Go to https://account.vintagestory.at/
2) Open spoiler `(Show all available downloads and mirrors of Vintage Story)`
3) Select needle version and copy download link `Linux tar.gz Archive (server only)`
4) Run `update_server.sh [PASTE_DOWNLOAD_URL]`

## HOW UPDATED MANUAL
1) Run `su -`
2) Run `cd /var/lib/docker/volumes/vintage_story/_data/server`
3) Run `wget -O server.tar.gz [PASTE_DOWNLOAD_URL]` or download and move archive manual (For example: scp)
4) Run `tar -xzf server.tar.gz`
5) Run `chmod +x ./server.sh && chmod +x ./VintagestoryServer.dll`
6) Open `server.sh` and change parameters: `USERNAME`, `VSPATH`, `DATAPATH` (use path inside container)

### WHERE PLACED BACKUPS
1) Run `su -`
2) Run `cd /var/lib/docker/volumes/vintage_story/_data/data/Backups`

### HOW TO GET INSIDE CONTAINER
1) Run `attach.sh`

