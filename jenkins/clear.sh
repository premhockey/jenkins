docker rm -f $(docker ps -qa)
docker rmi $(docker images)
