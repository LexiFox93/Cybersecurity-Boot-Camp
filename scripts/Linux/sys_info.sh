#!/bin/bash
#!/bin/bash

#check to see if script was run as root.  exit if true
if [ $UID -ne 0 ]; then
  echo "Please run this cript as root."
  exit
fi


#define variables
output=$HOME/research1/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
execs=$(find /home -type f -perm 777)
cpu=$(lscpu | grep CPU)
disk=$(df -H | head -2)

#define lists to use later
commands=(
  'date'
  'uname -a'
  'hostnam -s'
)

files=(
  '/etc/passwd'
  '/etc/shadow'
)


#mkdir !/research 2> /dev/null
#output=$HOME/research1/sys_info.txt

#check to see if research1 directory...create if needed
if [ ! -d $HOME/research1 ]
then
mkdir $HOME/research1
fi

#check for output file...clear if needed
if [ -f $output ]; then
   > $output
fi

##################################################################
#start script
echo "A Quick System Audit Script" > $output
date >> $output
echo "" >> $output

for x in {0..2}; do
  results=$(${commands[$x]})
  echo "Results of "${commands[$x]}" command:" >> $output
  echo $results >> $output
  echo "" >> $output

#display machine type
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output


#Display user name info
echo -e "Uname info: $(uname -a) \n" >> $output

#Display IP info
#echo "IP Info: $(ip addr | head -9 | tail -1) \n" >> $output
#ip=$(ip addr | head -9 | tail -1)
echo -e "IP Info:" >> $output
echo -e "$ip \n" >> $output

#Display Host name
echo -e "Hostname: $(hostname -s) \n" >> $output


#Display DNS info
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output

#Display Memory usage
echo -e "\nMemory Info:" >> $output
free >> $output

#Display CPU usage
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output


#Display disk usage
echo -e "\nDisk Usage:" >> $output
#df -H | head -2 >> $ouput
echo $disk >> $output

#Dispaly who is logged in
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output

#Dispaly sudo user files
echo -e "\nSUID Files:" >> $output

#list exec files
#find / -type f -perm /4000 >> $output
#execs=$(find /home -type f -perm 777)
echo -e "\nexec Files:" >> $output
for exec in $execs; do
  echo $exec >> $output
done

#list top 10 processess
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output

#check the permissions on files
echo -e "\nThe permission for sensitive /etc files: \n" >> $output
for file in ${files[@]}; do
  ls -l $file >> $output
done

#for loop that prints out 3, 5 & 7
