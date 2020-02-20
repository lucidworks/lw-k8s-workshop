#docker container run --env JAVA_OPTS="-Dqps.fusion.url=https://fusiondemo.lucidworkstest.com -Dqps.app=datagen" gatling-qps:feb11 -s FusionQueryTraffic

kubectl run --generator=run-pod/v1 --image=us.gcr.io/lw-support-team/gatling-qps:lab4 \
  --restart=Never \
  --env="JAVA_OPTS=-Dqps.fusion.url=http://35.230.105.8:6764 -Dqps.app=lab4 -Dqps.rps=600 -Dqps.duration.mins=15 -Dqps.ramp.secs=45" gatling-qps -- -s FusionQueryTraffic
