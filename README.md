# docker-cronicle


Docker stack/container for a Cronicle multi-server master/slave cluster

## latest
Latest version of Cronicle server based upon nodejs Docker image.


# Usage

## Install
```sh
docker pull arun15/cronicle_multi_server:latest
```

## Running
```sh
docker compose up --build
docker stack deploy --compose-file docker-stack.yml cronicle_stack
```

The web UI will be available at: http://localhost:3012 in native docker //docker-machine default node_ip:3012 / 3112:

> NOTE: please replace the hostname `localhost`, this is only for testing
> purposes! If you rename the hostname also consider setting the environmental
> variable `CRONICLE_base_app_url`.
> e.g `docker run --name cronicle --hostname cronicle-host -p 3012:3012 -e CRONICLE_base_app_url='http://cronicle-host:3012' intelliops/cronicle:latest`

## Volumes
| Path | Description |
|--------|--------|
| /opt/cronicle/data | Volume for data |
| /opt/cronicle/logs | Volume for logs |
| /opt/cronicle/plugins | Volume for plugins |

## Configuration

### Custom configuration file
A custom configuration file can be provide in the following location:
```sh
/path-to-cronicle-storage/data/config.json.import
```
The file will get loaded the very first time Cronicle is started. If afterwards
a forced reload of the custom configuration is needed remove the following file
and restart the Docker container:
```sh
/path-to-cronicle-storage/data/.setup_done
```

## Web UI credentials
The default credentials for the web interface are: `admin` / `admin`

# Reference
https://github.com/jhuckaby/Cronicle
