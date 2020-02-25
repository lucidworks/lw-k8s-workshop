#docker container run --env JAVA_OPTS="-Dqps.fusion.url=https://fusiondemo.lucidworkstest.com -Dqps.app=datagen" gatling-qps:feb11 -s FusionQueryTraffic

kubectl run --generator=run-pod/v1 --image=us.gcr.io/${LW_K8S_GCP_PROJECT}/gatling-qps:lab4 \
  --restart=Never \
  --env="JAVA_OPTS=-Dqps.fusion.url=http://${LW_K8S_GATEWAY_IP}:6764 -Dqps.app=lab4 -Dqps.rps=800 -Dqps.duration.mins=60 -Dqps.ramp.secs=60" gatling-qps -- -s FusionQueryTraffic
