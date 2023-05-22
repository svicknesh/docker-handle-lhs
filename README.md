# Handle Docker Composer

Docker compose file for deploying your very own Local Handle Service (LHS) Server.

## Notes

If you discover any typos or errors in this README.md, create an *ISSUE* with the relevant fix and I will make the changes accordingly. If you have any suggestions or improvements, please do the same.

## Pre-requisites

- Docker v24 or above.
- Docker compose v2.17.0 or above.

## Building the image

1. Clone this repository to a folder of your choice and switch to that directory.
```bash
git clone https://github.com/svicknesh/docker-handle-lhs /tmp/docker-handle-lhs
cd /tmp/docker-handle-lhs
```

2. Switch to the `build` directory
```bash
cd build
```

3. Build the image using tags of your preference
```bash
docker build --tag "git.openlab.itu.int/aims/lhs:latest" --tag "git.openlab.itu.int/aims/lhs:9.3.1" "$(pwd)"
```

4. The LHS docker container image is now ready to be used.

## Deploying docker image instance

1. Refer to the sample `docker-compose.yaml` file from `https://github.com/svicknesh/docker-handle-lhs/raw/master/docker-compose.yml`

2. Replace the image name with the image from the build process (if different, otherwise retain the image name).

3. Change the `PUID` and `PGID` to your host username `uid` and `gid` if it's different from `1000` for both.

4. For volume mount, change the name to the preferred path on the host system (left part only, do **NOT** change the right part). Create the folder with the correct `uid` and `gid` that matches step 3.

5. Change the port numbers to your preferred port. Change both the ports on the left and right of the _:_ to match. The LHS instance will listen on the configured port in *config.dct* and the host has to map the port accordingly.

6. This image will create the necessary configuration files for the LHS if they don't already exist. Remeber to match the ports and IP with the ones configured in step 5.

7. Start up the container
```bash
docker compose up -d
```

8. (For new setup) Send the generated `sitebndl.zip` from the data folder from host to a Naming Authority to obtain a prefix.

9. Once the Naming Authority has allocated a prefix, edit the `/config.dct` file and do the following
      - Replace **YOUR_PREFIX** with the prefix allocated by the Naming Authority, for instance **11.1234** under "server_admins", "replication_admins", and "auto_homed_prefixes".
      - Change the *bind_address* to **0.0.0.0** so that the instance can be reachable from the host. 

9. (For future runs) Start the container as step 7.

10. Edit `docker-compose.yml` and add more LHS information as needed. Multiple instances can be run using the same `docker-compose.yaml`. 

## License

Feel free to use this as you see fit. It does not come with any warranty, implied or otherwise.

