SKIPUNZIP=1

system_gid="1000"
system_uid="1000"
data_dir="/data/adb/Aurora"
ca_path="/system/etc/security/cacerts"

mkdir -p ${data_dir}
mkdir -p ${MODPATH}/system/bin
mkdir -p ${MODPATH}${ca_path}

unzip -o "${ZIPFILE}" -x 'META-INF/*' -d $MODPATH >&2

mv -f ${MODPATH}/binary/* ${MODPATH}/system/bin/
ln -sf /data/adb/modules/Aurora ${data_dir}

mkdir ${data_dir}
mv ${MODPATH}/cacert.pem ${MODPATH}${ca_path}
mv -n ${MODPATH}/Dashboard ${data_dir}/
rm -rf ${MODPATH}/Dashboard
mv -f ${MODPATH}/Aurora/* ${data_dir}/
rm -rf ${MODPATH}/Aurora
rm -rf ${MODPATH}/binary
ui_print "- 此版本建议热点设备安装"
sleep 1

ui_print "- 开始设置环境权限."
set_perm_recursive ${MODPATH} 0 0 0755 0644
set_perm  ${MODPATH}${ca_path}/cacert.pem  0  0  0644
set_perm_recursive ${data_dir} ${system_uid} ${system_gid} 0755 0644
set_perm_recursive ${data_dir}/scripts ${system_uid} ${system_gid} 0755 0755
set_perm_recursive ${MODPATH}/config ${system_uid} ${system_gid} 0755 0755
set_perm_recursive ${MODPATH}/system/bin ${system_uid} ${system_gid} 0755 0755