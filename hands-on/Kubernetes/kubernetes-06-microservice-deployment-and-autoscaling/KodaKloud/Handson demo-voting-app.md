cd voiting-app
ls

creat pod and servis .yaml file

k get pods
-no result
k get svc
-kubernetes clusterIP (defaılt)
k creat -f voiting-app-pod.yaml
k creat -f voiting-app-service.yaml

k get pods, svc

minikube service voiting-service --url
http://192.168.99.101:30004

k creat -f redis-app-pod.yaml
k creat -f redis-app-service.yaml

k get pods, svc

k creat -f postgres-app-pod.yaml
k creat -f postgres-app-service.yaml

k get pods, svc

k creat -f worker-app-pod.yaml
k creat -f worker-app-service.yaml

k get pods, svc

k creat -f result-app-pod.yaml
k creat -f result-app-service.yaml

k get pods, svc

minikube service result-service --url
http://192.168.99.101:30005

creat deployment .yaml file  (redis, postgres, voting )

ls -ltr

