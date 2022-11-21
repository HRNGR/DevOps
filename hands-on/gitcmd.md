export PS1="\[\e[1;31m\]\u\[\e[33m\]@\h# \W:\[\e[32m\]\\$\[\e[m\] "
sudo hostnamectl set-hostname D
alias k=kubectl
bash
clear

Kısayollar
------------
Renklendirmek için
.bashrc dosyasına sonsatıra aşağıdakini ekle (Komuta da yazarsak oluyor ama geçici EC2 stop/terminate olunca gidiyor)
ya da
export PS1="\e[3;33m[\u@\h \W]$ \e[0m"

export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] "

export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[34m\]@\[\e[m\]\[\e[43m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\[\e[38m\]]\[\e[m\]\[\e[32;48m\]\\$\[\e[m\] "
ubuntu;
export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] "
------------

sudo kubeadm join 172.31.20.50:6443 --token 3gzgkc.je9jpy43mpx4qfri \
        --discovery-token-ca-cert-hash sha256:ca77bd18c64c21c1b6b4f71f8bed6982786254aca37d52b850b1e81f477e2b26
-----------------------
Vi kısayollar
i // o insert ve ensona gelir
gg en başa gider         (insert demeden önce)
d satır siler
d15 15 satır birden siler
Çıkış;
esc :x! kaydetmeden
esc:vq!kaydederek
esc:wq kaydederek
esc:q! kaydetmeden
:q! Exit and ignore any changes
:x Exit, saving changes
-----------
sudo su (root a geçiyor)
sudo su - (root a geçiyor ve HOME a geçiyor)
su *** (*** user a geçiyor)
su - *** (*** user a geçiyor ve HOME a geçiyor)
sudo hostnamectl set-hostname First
apt = sudo (ubuntu)
apt install python3 -y
apt install python3-pip -y
pip list (mevcut programları yükler)
pip3 install asgiref==3.3.1 (asgiref 3.3.1 programını kurar)
----------
Key.pem taşıma
eval $(ssh-agent -s)  or  eval "$(ssh-agent)"
ssh-add -K FirstKey.pem
ssh -A ec2-user@54.234.128.151
----------
EC2 to PC File Trasnfer
$ scp -i firstkey.pem "ec2-user@54.161.246.232:/home/ec2-user/cs.sh"  ./
PC to EC2 File Trasnfer
$ scp -i firstkey.pem "./aa.sh" "ec2-user@54.161.246.232:/home/ec2-user/"
----------
VisualStudio'ya Remote-SSH extension ı yükle
View/Command Palette  (ctrl+shitf+p)
remote-ssh configuration file
c:USER\HRN\.shh\config
içine girip "" içindekini düzenleyerek yapıştıracağız"
"""""""""""""""""""""""
EC2yu sürekli açık tutma
Host *
    TCPKeepAlive yes
    ServerAliveInterval 120

Host linux
    HostName 13.58.215.54 (Bağlandığınız EC2nun ipsini yazıyorsunuz)
    IdentityFile C:\Users\harun.gur\.ssh\key.pem (Key dosyanızın konumunu yazıyorsunuz)
    User ec2-userl
    
   
Sağ altta yeşil kısma bas "connect to host" ya da "connect to host with current window" a tıkla
linux
continue
"""""""""""""""""""""""
------------
$*** değişken şeklinde algılıyor "..***..." tırnak içinde dahi başına ' $' / gelirse $ aktif olmuyor
------------
useradd user1
passwd user1
Usermode user1
------------
Echo > text.txt "asdas"    yaz
Echo >> text.txt "qwert"   yaz2.satıra yaz
cat text.txt               oku
rm text.txt                sil
------------
mkdir test
mkdir -p test/assa/asdas
------------
chmod +x test.sh
------------
cat test.sh (içini okur) => echo "hello world"
./test/test.sh (çalıştırır) => hello world (konuma gelip)
------------
export CLARUSW=env.var
echo $CLARUS => env.var
------------
sudo yum install httpd -y (Appacy yükleme)
------------
rm -rf * (nevarneyok sil)
rm data/* (nevarneyok sil)

grep -Eo "i-[a-Z 0-9]{17}"
docker container ls | grep nginx (containerlardan nginx olanları süzerek listeler)
------------
grep:
wc -l satır adedini verir (filitrelediğimiz seyin adedini verir)
-v eşleşmeyenler
-c eşleşen satır sayısı
-n eşleşen satır ve satır numarası
-i büyük küçük harf eşleşenler
-d "-" olan
tr 'a' 'b' A yerine b yaz
------------

