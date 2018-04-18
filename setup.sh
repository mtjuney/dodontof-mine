yum update -y && yum -y upgrade

yum install -y httpd
yum -y groups install "Development Tools"
yum install -y ruby rubygems

ln -s /usr/bin/ruby /usr/local/bin/ruby

gem update --system
gem install msgpack

cp -r imageUploadSpace /var/www/html/
cp -r saveData /var/www/

chmod 707 -R /var/www/html/imageUploadSpace
chmod 707 -R /var/www/saveData


bash deploy.sh

# httpdの設定
echo \<Directory "/var/www/html/DodontoF"\> >> /etc/httpd/conf/httpd.conf
echo Options FollowSymLinks ExecCGI >> /etc/httpd/conf/httpd.conf
echo AddHandler cgi-script .rb .pl >> /etc/httpd/conf/httpd.conf
echo AddHandler application/x-shockwave-flash .swf >> /etc/httpd/conf/httpd.conf
echo \</Directory\> >> /etc/httpd/conf/httpd.conf

# ポートを開放する
firewall-cmd --permanent --zone public --add-service http
systemctl enable httpd

systemctl start httpd