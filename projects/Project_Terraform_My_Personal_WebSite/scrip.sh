#! /bin/bash

yum update -y
sudo amazon-linux-extras install nginx1.12
sudo systemctl start nginx
cd /usr/share/nginx/html
chmod -R 777 /usr/share/nginx/html
rm index.html
FOLDER="https://raw.githubusercontent.com/HRNGR/mywebsite/main/harungurcom/" #kendi github uzantınızı eklemeniz lazım
wget "${FOLDER}"/index.html
wget "${FOLDER}"/about.html
wget "${FOLDER}"/myproject.html
wget "${FOLDER}"/gallery.html
wget "${FOLDER}"/contacts.html
mkdir css && cd css
wget "${FOLDER}"/css/component.css
wget "${FOLDER}"/css/form.css
wget "${FOLDER}"/css/grid.css
wget "${FOLDER}"/css/ie.css
wget "${FOLDER}"/css/reset.css
wget "${FOLDER}"/css/slider.css
wget "${FOLDER}"/css/style.css
wget "${FOLDER}"/css/superfish.css
wget "${FOLDER}"/css/touchTouch.css
cd /usr/share/nginx/html
mkdir js && cd js
wget "${FOLDER}"/js/forms.js
wget "${FOLDER}"/js/html5shiv.js
wget "${FOLDER}"/js/jquery.carouFredSel-6.1.0-packed.js
wget "${FOLDER}"/js/jquery.easing.1.3.js
wget "${FOLDER}"/js/jquery.equalheights.js
wget "${FOLDER}"/js/jquery.jqtransform.js
wget "${FOLDER}"/js/jquery.js
wget "${FOLDER}"/js/jquery.touchSwipe.min.js
wget "${FOLDER}"/js/jquery.ui.totop.js
wget "${FOLDER}"/js/jquery-migrate-1.1.1.js
wget "${FOLDER}"/js/jquery-ui-1.10.3.custom.min.js
wget "${FOLDER}"/js/PIE.htc
wget "${FOLDER}"/js/sForm.js
wget "${FOLDER}"/js/superfish.js
wget "${FOLDER}"/js/tms-0.4.1.js
wget "${FOLDER}"/js/touchTouch.jquery.js
cd
cd /usr/share/nginx/html
mkdir images && cd images
wget "${FOLDER}"/images/logo.gif
wget "${FOLDER}"/images/preloader.gif
wget "${FOLDER}"/images/favicon.gif
wget "${FOLDER}"/images/favicon.ico
wget "${FOLDER}"/images/bg_body.jpg
wget "${FOLDER}"/images/big1.jpg
wget "${FOLDER}"/images/big2.jpg
wget "${FOLDER}"/images/big3.jpg
wget "${FOLDER}"/images/big4.jpg
wget "${FOLDER}"/images/big5.jpg
wget "${FOLDER}"/images/big6.jpg
wget "${FOLDER}"/images/big7.jpg
wget "${FOLDER}"/images/big8.jpg
wget "${FOLDER}"/images/big9.jpg
wget "${FOLDER}"/images/big10.jpg
wget "${FOLDER}"/images/big11.jpg
wget "${FOLDER}"/images/big12.jpg
wget "${FOLDER}"/images/line2_img2.jpg
wget "${FOLDER}"/images/line3_img1.jpg
wget "${FOLDER}"/images/line3_img3.jpg
wget "${FOLDER}"/images/me.jpg
wget "${FOLDER}"/images/page2_img1.jpg
wget "${FOLDER}"/images/page3_img1.jpg
wget "${FOLDER}"/images/page3_img2.jpg
wget "${FOLDER}"/images/page3_img3.jpg
wget "${FOLDER}"/images/page3_img4.jpg
wget "${FOLDER}"/images/page3_img5.jpg
wget "${FOLDER}"/images/page3_img6.jpg
wget "${FOLDER}"/images/page3_img7.jpg
wget "${FOLDER}"/images/page3_img8.jpg
wget "${FOLDER}"/images/page3_img9.jpg
wget "${FOLDER}"/images/page3_img10.jpg
wget "${FOLDER}"/images/page3_img11.jpg
wget "${FOLDER}"/images/page3_img12.jpg
wget "${FOLDER}"/images/slide.jpg
wget "${FOLDER}"/images/slide1.jpg
wget "${FOLDER}"/images/slide2.jpg
wget "${FOLDER}"/images/slide3.jpg
wget "${FOLDER}"/images/arrowws.png
wget "${FOLDER}"/images/aws.png
wget "${FOLDER}"/images/bq_bot_bg.png
wget "${FOLDER}"/images/envel.png
wget "${FOLDER}"/images/gallery1.png
wget "${FOLDER}"/images/gallery2.png
wget "${FOLDER}"/images/gallery3.png
wget "${FOLDER}"/images/gallery4.png
wget "${FOLDER}"/images/gallery5.png
wget "${FOLDER}"/images/gallery6.png
wget "${FOLDER}"/images/gallery7.png
wget "${FOLDER}"/images/gallery8.png
wget "${FOLDER}"/images/gallery9.png
wget "${FOLDER}"/images/line1_img1.png
wget "${FOLDER}"/images/line1_img2.png
wget "${FOLDER}"/images/line1_img3.png
wget "${FOLDER}"/images/line2_img1.png
wget "${FOLDER}"/images/line2_img3.png
wget "${FOLDER}"/images/line2_img2.png
wget "${FOLDER}"/images/line3_img2.png
wget "${FOLDER}"/images/magnify.png
wget "${FOLDER}"/images/marker.png
wget "${FOLDER}"/images/marker1.png
wget "${FOLDER}"/images/prevnext.png
wget "${FOLDER}"/images/select.png
wget "${FOLDER}"/images/slide.png
wget "${FOLDER}"/images/smallview1.png
wget "${FOLDER}"/images/smallview2.png
wget "${FOLDER}"/images/smallview3.png
wget "${FOLDER}"/images/smallview4.png
wget "${FOLDER}"/images/smallview5.png
wget "${FOLDER}"/images/smallview6.png
wget "${FOLDER}"/images/smallview7.png
wget "${FOLDER}"/images/smallview8.png
wget "${FOLDER}"/images/smallview9.png
wget "${FOLDER}"/images/socials.png
wget "${FOLDER}"/images/totop.png
systemctl restart nginx
systemctl enable nginx
cd ..