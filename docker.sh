clear_images
#!/usr/bin/env bash
docker ps -a | awk  '{print $1}' |xargs docker rm -f
docker images |grep -v swarm |awk '{print $3}' |xargs docker rmi -f

---docker  images 需要账号密码部署----------
docker stack deploy -c 11.yaml 11 --with-registry-auth

实现容器的均衡分布
-----1-node 加标签-----
docker node update --label-add datacenter=east docker2
----2 docker  deploy 增加placement---
      placement:
        constraints:
          - node.role == worker
          #- node.labels.datacenter == east

