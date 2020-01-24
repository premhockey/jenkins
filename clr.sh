docker  rm -f $(docker  ps -aq)
docker rmi -f $(docker images -a -q)
docker ps
docker ps -a
docker images
