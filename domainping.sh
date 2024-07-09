#！/bin/sh
wx(){
cat > $0.msg << EOF
curl '$WEBHOOK' \
   -H 'Content-Type: application/json' \
   -d '
   {
        "msgtype": "text",
        "text": {
            "content": "$1",
            "mentioned_mobile_list":["$2"]
        }
   }'
EOF
sh $0.msg && rm -rf $0.msg
}
# echo "$1"
# a=$(tcping -x 2 "$1")
#b=$(tcping -x 2 192.168.2.1 81)
#o="open"
#c=$(tcping -x 5  lixiaohu.nom.za) 
#d=$(tcping -x 5  qinjiaxian.nom.za)        
#e=$(tcping -x 5  yiyeshu.nom.za)
#echo "$c"
#echo "$d"
#echo "$e"
li=$(dig +trace lixiaohu.nom.za)
echo "$li"
ns=ins1.c6dns.com
result1=$(echo $li | grep "${ns}")
echo "$result1"
#result1=$(echo $c | grep "${o}")
#result2=$(echo $c | grep "${o}")
#result3=$(echo $c | grep "${o}")

if [ "$result1" != "" ]||[ "$result2" != "" ]||[ "$result3" != "" ]; then
wx "github提醒您，您的nom域名通过了，请迅速查收"
fi
