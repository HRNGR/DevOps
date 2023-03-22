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
