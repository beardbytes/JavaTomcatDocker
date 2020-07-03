## Dockerfile for centos and tomcat
- Make sure you have docker in your system . `sudo apt-get install docker`
- The dockerfile present here is part of a project present *[here](https://github.com/beardbytes/JavaCRUDRestWS)*.
- First run `git clone "https://github.com/beardbytes/JavaTomcatDocker"`
- Then `cd JavaTomcatDocker`
- Before running the dockerfile, install *[apache-tomcat](https://tomcat.apache.org/download-80.cgi)* and keep the tar file in the same directory where dockerfile id present.
- Steps to run the dockerfile :

1. Build the image : `sudo docker build -t centos/tomcat8`
2. See the list of images : `sudo docker images ls`
3. Run the container : `sudo docker container run -it -d --name tomcatcontainer1 -p 8081:8080 centos/tomcat8`
   - if you look into tomcat dockerfile, you will find tomcat expose port 8080, so while creating container we map tomcat container port to local 	machine port by using --publish <local_machine_port>:<tomcat_expose_port>
   - you will find that the container is up and running by the following command : `sudo docker ps -a`
4. Finally run this command : `sudo docker run -it centos/tomcat8`

- In case you get the error that AppStream could not be found then don't panic . I have fix for you.
- Follow these steps:
1. `cd etc/docker/`.
2. Make a new file with the name *daemon.json* in this directory.
3. Add these two lines in this file (Use editor of your choice.):
   - `{"dns":["192.168.1.1","8.8.8.8"]}`

- And here we go....the dockerfile starts running again.
- *PS:The above fix worked for me.Or else use [this](https://google.com)*. 

- To make your life easier just do the following : `sudo docker pull adi123456789/tomcat8`.
