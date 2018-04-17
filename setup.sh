yum update -y && yum -y upgrade

# # どどんとふをコピー
cp -r www /var/

yum install -y httpd
yum install -y ruby rubygems
ln -s /usr/bin/ruby /usr/local/bin/ruby
gem update --system

# 権限変更
chmod 705 -R /var/www/html/DodontoF
chmod 703 -R /var/www/html/DodontoF/saveDataTempSpace
chmod 703 -R /var/www/html/DodontoF/fileUploadSpace
chmod 703 -R /var/www/html/DodontoF/replayDataUploadSpace
chmod 606 -R /var/www/html/DodontoF/log.*
chmod 707 -R /var/www/html/imageUploadSpace
chmod 707 -R /var/www/saveData

# httpdの設定
echo \<Directory "/var/www/html/DodontoF"\> >> /etc/httpd/conf/httpd.conf
echo Options FollowSymLinks ExecCGI >> /etc/httpd/conf/httpd.conf
echo AddHandler cgi-script .rb .pl >> /etc/httpd/conf/httpd.conf
echo AddHandler application/x-shockwave-flash .swf >> /etc/httpd/conf/httpd.conf
echo \</Directory\> >> /etc/httpd/conf/httpd.conf

# ポートを開放する
firewall-cmd --permanent --zone public --add-service http
systemctl enable httpd

# /etc/init.d/httpd start
systemctl start httpd