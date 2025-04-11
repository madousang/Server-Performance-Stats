echo "Total CPU usage"
top -bn1 | grep "Cpu(s)"

echo "\nTotal memory usage (Free, Used)"

free | awk '$2 ~ /^u/ {print "         " $2"  "$3}'
free -h | awk '/Mem/ {print "Memory : " $3" "$4"\n"}'

echo "Total disk usage (Free, Used)"
df -h | awk '$2 ~ /^S/ {print "Disk memory     " $2"   "$3" "$4" "$5}'
df -h | grep /dev/sda2

echo "\nTop 5 processes by CPU usage"

top -o "%CPU" -bn 1 > topCPU_file.txt 
head -n 12 topCPU_file.txt

echo "\nTop 5 processes by Memory usage"

top -o "%MEM" -bn 1 > topMEM_file.txt 
head -n 12 topMEM_file.txt

