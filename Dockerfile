from ubuntu:latest
run apt update -y && apt install snort nano vim -y 
copy local.rules /etc/snort/rules
cmd ["bash", "-c", "snort -q -A console -c /etc/snort/snort.conf -i wlo1 &>> /root/snort_log.txt "]



