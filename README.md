# Time Machine Out of the Box
Yet another Time Machine Docker image.

## TL;DR
Install Docker and Docker Compose before running the commands below.

```bash
git clone https://github.com/Astrian/time-machine-oob.git
cd time-machine-oob
cp docker-compose-sample.yml docker-compose.yml
docker-compose up -d
```

Then, go to your Mac, and launch Time Machine preference. Click the “Select Disk” button, and select the instance you just deployed. Input username (`timemachine`) and password (`timemachine`).

Okay! Just go ahead and back up your Mac.

## Detailed Instructions
You can customize the configuration by editing the `docker-compose.yml` file. Clone and copy the sample first, then edit the `environment` variables.

| Variable name | Meaning | Default value in `docker-compose-sample.yml` |
| --- | --- | --- |
| TM_USERNAME | Volume access username | timemachine |
| TM_PASSWORD | Volume access password | timemachine |
| TM_UID | Time Machine volume owner UID | 1000 |
| TM_GID | Time Machine volume owner GID | 1000 |
| TM_SHARENAME | Time Machine volume name, will be shown in your Time Machine preference | TimeMachine |
| TM_SIZE | Volume size limit, with megabytes | 0 (limited to your physical size) |

Also, you can change the `volumes` section to export your backup image. The default volume is mounted to the `./timemachine_backup` directory.

## Special Architecture
If your target machine is in ARM64 architecture, you can use the `arm64-latest` tag. Just copy the `docker-compose-sample.yml` file, change the `image` value to `astrian/time-machine-oob:arm64-latest`, and run `docker-compose up -d`.

You must compile the container yourself if you want to run the container on a machine with a non-AMD64 and non-ARM64 architecture. The `dockerfile` is available in the repository.