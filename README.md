# Handle Docker Composer

Docker compose file for deploying your very own Local Handle Service (LHS) Server.

## Notes

If you discover any typos or errors in this README.md, create an *ISSUE* with the relevant fix and I will make the changes accordingly. If you have any suggestions or improvements, please do the same.

## Pre-requisites

- Docker v17.05 or above.
- Docker compose v1.17.0 or above.
- OpenJDK 9 on the host machine.
  - It is not compulsory to have OpenJDK on the host machine if it is just going to serve the LHS. The initial configuration can be done on another machine if needed. It is just recommended to have it installed to make management easier.

## Deploying docker instance

**NOTE**: The LHS does not need to be run as the `root` user. It is recommended to run it as a normal user who has permission to manage Docker instances.

1. Clone this repository to a folder of your choice and switch to that directory.
2. Edit the `docker-compose.yml` file and replace *handle-instance* with a more memorable name such as *vicknesh-lhs*.
3. For volumes, replace *./instance-data* with a folder to store Handle data related to this docker instance. For the above example, you can replace the folder name with *./vicknesh-data*
4. Change the port numbers to your preferred port. Change both the ports on the left and right of the _:_ to match. The LHS instance will listen on the configured port in *config.dct* and the host has to map the port accordingly.
5. Before starting the instance, generate the relevant information about the site. Using the above information as an example
```bash
./hsj/bin/hdl-setup-server ./vicknesh-data/
```
6. Send the `./vicknesh-data/sitebndl.zip` to a Naming Authority to obtain a prefix.
7. Once the Naming Authority has allocated a prefix, edit the `./vicknesh-data/config.dct` file and do the following
      - Replace **YOUR_PREFIX** with the prefix allocated by the Naming Authority, for instance **11.1234** under "server_admins", "replication_admins", and "auto_homed_prefixes".
      - Change the *bind_address* to **0.0.0.0** so that the instance can be reachable from the host. 
8. Start the Docker instance with Docker Compose like the following
```bash
docker-compose build
docker-compose up -d
```
9. Edit `docker-compose.yml` and add more LHS information as needed. Multiple instances can be run using Docker. Just make sure to perform task (5), (6) and (7) to configure the site. To start up the new instances, just do the following
```bash
docker-compose up -d
```

## Quick deployment

```bash
git clone https://github.com/svicknesh/docker-handle-lhs docker-handle-lhs
cd docker-handle-lhs
./hsj/bin/hdl-setup-server ./instance-data/
```
Once Naming Authority has allocated a prefix, edit `./vicknesh-data/config.dct` and replace **YOUR_PREFIX** with the prefix given. Change the *bind_address* to **0.0.0.0** so that the instance can be reachable from the host. Then start up your Docker instance as the following

```bash
docker-compose build
docker-compose up -d
```

## License

Feel free to use this as you see fit. It does not come with any warranty, implied or otherwise.

