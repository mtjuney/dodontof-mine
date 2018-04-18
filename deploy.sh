# どどんとふをコピー
cp -r DodontoF /var/www/html/
rsync -av DodontoF/ /var/www/html/DodontoF/

# 権限変更
chmod 705 -R /var/www/html/DodontoF
chmod 703 -R /var/www/html/DodontoF/saveDataTempSpace
chmod 703 -R /var/www/html/DodontoF/fileUploadSpace
chmod 703 -R /var/www/html/DodontoF/replayDataUploadSpace
chmod 606 -R /var/www/html/DodontoF/log.*

