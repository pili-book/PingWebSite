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
qin=$(dig +trace qinjiaxian.nom.za)
echo "$qin"
yi=$(dig +trace yiyeshu.nom.za)
echo "$yi"
ns=rhinoceros.dnspod.net
result1=$(echo $li | grep "${ns}")
result2=$(echo $qin | grep "${ns}")
result3=$(echo $yi | grep "${ns}")
if [ "$result1" != "" ]||[ "$result2" != "" ]||[ "$result3" != "" ]; then
wx "github提醒您，您的nom域名通过了，请迅速查收"
fi
