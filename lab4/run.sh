#docker container run --env JAVA_OPTS="-Dqps.fusion.url=https://fusiondemo.lucidworkstest.com -Dqps.app=datagen" gatling-qps:feb11 -s FusionQueryTraffic

kubectl run --generator=run-pod/v1 --image=us.gcr.io/solr-dev/gatling-qps:lab4 \
  --restart=Never \
  --env="JAVA_OPTS=-Dqps.fusion.url=https://tjp23265.lucidworkstest.com -Dqps.app=lab4 -Dqps.rps=180" gatling-qps -- -s FusionQueryTraffic
