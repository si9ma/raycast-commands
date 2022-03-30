#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Date Conversion
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⏱
# @raycast.argument1 { "type": "text", "placeholder": "date" }
# @raycast.argument2 { "type": "text", "placeholder": "target format(s/ymd/ymdhms/ymdnone)" }
# @raycast.packageName Developer Utils
# @raycast.needsConfirmation false

# Documentation:
# @raycast.author si9ma
# @raycast.authorURL https://github.com/si9ma

input=$1
format=$2

case "$format" in
   "s")
      format="%s"
      ;;
   "ymd")
      format="%Y-%m-%d"
      ;;
   "ymdnone")
      format="%Y%m%d"
      ;;
   "ymdhms")
      format="%Y-%m-%d %H:%M:%S"
      ;;
esac


if echo $input | /usr/local/opt/grep/libexec/gnubin/grep -P '^[0-9]+$' > /dev/null;then
   res=`/usr/local/opt/coreutils/libexec/gnubin/date -d @$input +"$format"`
else
   res=`/usr/local/opt/coreutils/libexec/gnubin/date -d "$input" +"$format"`
fi

echo $res | pbcopy
echo $res


