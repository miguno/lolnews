#!/usr/bin/env bash
#
# A shell tool designed to download news headings about the game League of Legends.

### Environment setup: BEGIN
MYSELF=`basename $0`
MY_DIR=`echo $(cd $(dirname $0); pwd)`
. $MY_DIR/sh/common.sh

if [ "$OS" = "$OS_MAC" ]; then
  SED_OPTS='-E'
else
  SED_OPTS='-r'
fi
### Environment setup: END

NEWS_URL='http://beta.na.leagueoflegends.com/en/news/'

# Force bash to split strings only at newlines but not at other whitespace like " "
IFS=$'\n'

HEADINGS=`curl -s $NEWS_URL | grep '<h4>' | sed $SED_OPTS 's/^.*<a [^>]*>([^<]+)<.*$/\1/'`

index=1
for heading in $HEADINGS; do
  echo "$index => $heading"
  let index=index+1
done
