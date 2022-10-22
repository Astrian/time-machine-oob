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
| TM_SIZE | Volume size limit,  | 0 (limited to your physical size) |

## Special Architecture
If you want to run the container on a machine with a non-AMD64 architecture, you need to compile the container yourself. The `dockerfile` is available in the repository.