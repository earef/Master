#!/bin/bash

##Adding eth0 into NS1

ip netns add ns1
#ip link set dev <device> netns <namespace>
ip link set dev eth0 netns ns1
ip netns exec ns1 ip link set dev lo up
ip netns exec ns1 ip address
ip netns exec ns1 ip address add 192.168.1.1/24 dev eth0
ip netns exec ns1 ip address show eth0
ip netns exec ns1 ip link set dev eth0 up
ip netns exec ns1 ip address show eth0
ip netns exec ns1 ping -c 4 192.168.1.1


##Adding wlan0 into NS2

ip netns add ns2
iw phy phy0 set netns name ns2
iw list
ip netns exec ns2 ip address add 192.168.1.2/24 dev wlan0
ip netns exec ns2 ip address show wlan0
ip netns exec ns2 ip link set wlan0 up
#or
ip netns exec ns2 ip link set dev wlan0 up
ip netns exec ns2 ip addr show
ip netns exec ns2 ping -c 4 192.168.1.2
Exit
