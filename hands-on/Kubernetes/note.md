İzleme Komutları
------------------------

1) kubectl get po -o wide (ANLIK)
2) kubectl get po -w (ANLIK)
3) watch kube get po (Sürekli)

## Bunlarla yan sekmede izle



Swap
Aşağıdaki işlemler tüm makinelerde yapılmalıdır.

Kubernetes'in çalışabilmesi için tüm makinelerimizde swap'ı kapatıyoruz.

sudo swapoff -a
Ek olarak aşağıdaki sed komutu ile birlikte eğer fstab dosyamızda swap la ilgili bir tanım var ise onu kaldırıyoruz. Sizler /etc/fstab dosyasını doğrudan düzenleyerek de işlem sağlayabilirsiniz.

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
Ardından gerekli bazı paketleri kuracağız.

sudo apt-get update && sudo apt-get install -y apt-transport-https curl


rollout restart
-------------------------
+ kubectl rollout restart deployment varnish-cache-deployment --namespace flo --context flo-preprod
deployment.apps/varnish-cache-deployment restarted
+ kubectl rollout status deployment varnish-cache-deployment --namespace flo --context flo-preprod
Waiting for deployment "varnish-cache-deployment" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "varnish-cache-deployment" rollout to finish: 1 old replicas are pending termination...
deployment "varnish-cache-deployment" successfully rolled out
----------------------------------------------
Pod a baglanma ve Pod un loglarına bakma
h-4.2$ sudo su
[root@ip-10-65-116-234 bin]# su jenkins
bash-4.2$ kubectl get ns
NAME                    STATUS        AGE
alb-ingress             Active        209d
argocd                  Active        324d
flo                     Active        294d

bash-4.2$ kubectl get pods -n butigo-panel
NAME                                               READY   STATUS    RESTARTS   AGE
butigo-panel-preprod-deployment-6f4f867dcf-7lgcv   1/1     Running   0          3h9m
varnish-cache-deployment-8674d8577b-vd2qh          1/1     Running   0          15h
*****
bash-4.2$ kubectl exec -it butigo-panel-preprod-deployment-6f4f867dcf-7lgcv -n butigo-panel bash
root@butigo-panel-preprod-deployment-6f4f867dcf-7lgcv:/var/log/nginx# cat error.log
2023/04/10 10:18:55 [error] 21#21: *9 FastCGI sent in stderr: "PHP message: PHP Fatal error:  Uncaught Exception: Undefined Florchestra URL. in /var/www/panel/app/Model/V1/Florchestra.php:428
Stack trace:
#0 /var/www/panel/app/Model/V1/Florchestra.php(1797): App\Model\V1\Florchestra->doRequest(Array, 'api/custom_site...', 'POST', Array, true)
#7 /var/www/panel/public/index.php(9): Butterfly\Framework\App::init()
#8 {main}  th in /var/www/panel/app/Model/V1/Florchestra.php on line 428" while reading response header from u

----------------------------------------------
Pod RDS portuna erişip erişmediği test etmek i.in
nc-v flocomtr-backupv2-cluster-w2.ctygmjmovavk.eu-central-1.rds.amazonaws.com 3306
