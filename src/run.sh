#########################################################################
# File Name: run.sh
# Author: Danny
# mail: dannysdable@gmail.com
# Created Time: 2017-09-13 23:42
#########################################################################
#!/bin/bash

function run {
  if [ ! -f scanner ];then
    echo "#####################################"
    echo "make start ..."
    make -f ./makefile > make.log 2>&1
    if [ $? == 0 ];then
      echo "make done ..."
      echo "#####################################"
      echo
      echo "start ..."
      echo
      #execute
      ./scanner < ./sqlexample
    else
      echo "make error ..."
      echo "Check make.log for detail ..."
      echo
    fi
  fi
}


echo
echo "#####################################"
echo "make clen ..."
make clean
echo "make done ..."


#start
run

echo "#####################################"
echo "The End ..."

exit

