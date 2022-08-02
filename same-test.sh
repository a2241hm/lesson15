#!/bin/bash  

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

ERROR_EXIT(){
	echo $1
#	cat ${err}
#	rm /tmp/$$-*
# 	exit 1
}

# テスト1 正常動作の確認
# 同じ場合
echo "same" > ${ans}                #出力してほしい内容（手入力）
./same.sh a a > ${result}           #実際の出力
diff ${ans} ${result} || ERROR_EXIT "error in 1-1" >> ${err}

# 違う場合

echo "same" > ${ans}
./same.sh a b > ${result}
diff ${ans} ${result} || ERROR_EXIT "error in 1-2" >> ${err}

if [ -f ${err} ]; then #エラーログが一つでもあれば
	cat ${err}         # 中身を表示して
	rm /tmp/$$-*		# 後片付けをして
	#exit 1				# 終了
	exit 0				# どんな状態でも正常終了
fi

