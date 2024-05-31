#! /usr/bin/bash
mkdir rootarea
echo CLEANING under ./rootarea/ 
sudo rm -f ./rootarea/*
echo GIVE  this dir 'root:root' as owner 
sudo chown root:root rootarea
echo GIVE  this dir rwxrwxr-- permission 
sudo chmod 774 rootarea
gcc -o runwithuid writewithuid.c
cp runwithuid runnotuid
sudo chown root runwithuid
sudo chmod 4750 runwithuid
gcc -o runwithgid writewithgid.c
cp runwithgid runnotgid
sudo chown $(id -un):root runwithgid
sudo chmod 2750 runwithgid
ls -l 

echo RUN \$ ./runnotuid  
./runnotuid
echo RUN \$ ./runnotgid 
./runnotgid
echo CHECKING if any files  in 'rootarea'
sudo ls -l rootarea
echo Here is not any files

echo executing binary with UID and GID
echo RUN \$ ./runwithuid  
./runwithuid  
echo RUN \$ ./runwithgid 
./runwithgid 
echo CHECKing if any files  in 'rootarea'
echo Then here are some files
sudo ls -l rootarea
