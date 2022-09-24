#!/bin/bash
mediacheck(){
if [ "${aa}" = "/media" ]; then
        echo "mount가 된 상태입니다"
else
       echo "mount가 되지 않았습니다.mount후 다시 실행하십시오"
        exit
fi
}


aa=$(df -h | grep -i media | awk '{print $6}')
mediacheck








