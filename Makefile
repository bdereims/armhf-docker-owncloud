CONTAINER_NAME=owncloud
IMAGE_NAME=bdereims/armhf-owncloud
VOLUME=/mnt/gv-01/Volumes/owncloud

build: Dockerfile
	docker build -t $(IMAGE_NAME) .

run:
	docker run -d -p 8080:80 -p 8443:443 -v $(VOLUME):/var/www/owncloud/data --name $(CONTAINER_NAME) $(IMAGE_NAME)

stop:
	docker stop $(CONTAINER_NAME) 
	docker rm $(CONTAINER_NAME) 

clean: 
	docker rmi $(IMAGE_NAME) 

clean-volume:
	rm -fr $(VOLUME)/{*,.??*}
