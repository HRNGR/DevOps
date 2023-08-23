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
-------------------------



pod baglanma
-------------------------
sh-4.2$ sudo su
[root@ip-10-40-119-82 bin]# su jenkins
bash-4.2$ kubectl get ns
NAME                       STATUS   AGE
alb-ingress                Active   463d
checkout-butigo            Active   286d
default                    Active   463d
flopay                     Active   407d
flopay-prod                Active   398d
kube-node-lease            Active   463d
kube-public                Active   463d
kube-system                Active   463d
logging                    Active   348d
monitoring                 Active   313d

bash-4.2$ kubectl get pod -n flopay-prod
NAME                                 READY   STATUS      RESTARTS   AGE
flopay-deployment-f5fc5d797-7gkbf    1/1     Running     0          10d
flopay-deployment-f5fc5d797-7zkf5    1/1     Running     0          91m

bash-4.2$ kubectl exec -it flopay-deployment-f5fc5d797-7gkbf -n flopay-prod bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.

root@flopay-deployment-f5fc5d797-7gkbf:/var/www/flopay# 

root@flopay-deployment-f5fc5d797-7gkbf:/var/www/flopay# curl -vvv https://epay-oauth.homebank.kz/oauth2/token


----------------------------------------------
Pod un loglarına bakma
h-4.2$ sudo su
[root@ip-10-65-116-234 bin]# su jenkins
bash-4.2$ kubectl get ns
NAME                    STATUS        AGE
alb-ingress             Active        209d
argocd                  Active        324d
flo                     Active        294d
flo-panel               Active        291d
game-2048               Terminating   32d
gitlab-agent            Active        40d
instreet                Active        294d
instreet-panel          Active        291d
lumberjacktr            Active        318d
monitoring              Active        138d
ninewest                Active        294d
ninewest-panel          Active        291d
orkestra                Active        292d
reebok                  Active        47d
reebok-panel            Active        47d
shm                     Active        115d
bash-4.2$ ^C
bash-4.2$ kubectl get pods -n butigo-panel
NAME                                               READY   STATUS    RESTARTS   AGE
butigo-panel-preprod-deployment-6f4f867dcf-7lgcv   1/1     Running   0          3h9m
varnish-cache-deployment-8674d8577b-vd2qh          1/1     Running   0          15h
bash-4.2$ kubectl exec -it butigo-panel-preprod-deployment-6f4f867dcf-7lgcv -n butigo-panel bash
kubectl exec [POD] [COMMAND] is DEPRECATED and will be removed in a future version. Use kubectl exec [POD] -- [COMMAND] instead.
root@butigo-panel-preprod-deployment-6f4f867dcf-7lgcv:/var/www/panel# cd /var/log
root@butigo-panel-preprod-deployment-6f4f867dcf-7lgcv:/var/log# cd nginx
root@butigo-panel-preprod-deployment-6f4f867dcf-7lgcv:/var/log/nginx# ls -al
total 2196
drwxr-xr-x 1 root  adm       41 Apr  6 20:13 .
drwxr-xr-x 1 root  root      48 Apr  7 12:43 ..
-rwxrwxrwx 1 nginx adm  1266039 Apr 10 12:33 access.log
-rwxrwxrwx 1 nginx adm    19253 Apr 10 11:18 error.log
root@butigo-panel-preprod-deployment-6f4f867dcf-7lgcv:/var/log/nginx# cat error.log
2023/04/10 10:18:55 [error] 21#21: *9 FastCGI sent in stderr: "PHP message: PHP Fatal error:  Uncaught Exception: Undefined Florchestra URL. in /var/www/panel/app/Model/V1/Florchestra.php:428
Stack trace:
#0 /var/www/panel/app/Model/V1/Florchestra.php(1797): App\Model\V1\Florchestra->doRequest(Array, 'api/custom_site...', 'POST', Array, true)
#1 /var/www/panel/app/Library/Flo/Utils.php(1923): App\Model\V1\Florchestra->getCustomSiteSettingByKey('white_list')
#2 /var/www/panel/app/Library/Flo/Cors/AccessControl.php(19): App\Library\Flo\Utils::getAllowedDomains()
#3 /var/www/panel/app/Controller/V1/BaseAction.php(28): App\Controller\V1\BaseAction->AllowHttpOrigin()
#4 /var/www/panel/vendor/butterfly/core/src/Framework/App.php(492): App\Controller\V1\BaseAction->__construct('index', 'index')
#5 /var/www/panel/vendor/butterfly/core/src/Framework/App.php(451): Butterfly\Framework\App::initControllerAction('index::index')
#6 /var/www/panel/vendor/butterfly/core/src/Framework/App.php(33): Butterfly\Framework\App::prerouter()
#7 /var/www/panel/public/index.php(9): Butterfly\Framework\App::init()
#8 {main}
  th in /var/www/panel/app/Model/V1/Florchestra.php on line 428" while reading response header from u


----------------------------------------------
Pod RDS portuna erişip erişmediği test etmek i.in
nc-v flocomtr-backupv2-cluster-w2.ctygmjmovavk.eu-central-1.rds.amazonaws.com 3306

  

