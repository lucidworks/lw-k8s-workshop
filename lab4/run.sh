#docker container run --env JAVA_OPTS="-Dqps.fusion.url=https://timmay.lucidworkssales.com -Dqps.app=lab4" gatling-qps:tjp -s FusionQueryTraffic

kubectl run --generator=run-pod/v1 --image=us.gcr.io/lw-sales/gatling-qps:tjp --env="JAVA_OPTS=-Dqps.fusion.url=https://timmay.lucidworkssales.com -Dqps.app=lab4" gatling-qps -- -s FusionQueryTraffic
