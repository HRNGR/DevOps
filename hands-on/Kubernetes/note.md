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
