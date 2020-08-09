docker build -t canya145/multi-client:latest -t canya145/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t canya145/multi-server:latest -t canya145/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t canya145/multi-worker:latest -t canya145/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push canya145/multi-client:latest
docker push canya145/multi-client:$SHA
docker push canya145/multi-server:latest
docker push canya145/multi-server:$SHA
docker push canya145/multi-worker:latest
docker push canya145/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=canya145/multi-client:$SHA
kubectl set image deployments/server-deployment server=canya145/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=canya145/multi-worker:$SHA