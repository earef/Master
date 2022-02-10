##!/bin/bash

ip netns add A ;
ip netns add Z ; #Creates A and Z networks
#ovs-vsctl add-br OVS1 ; #creates the connection tube
echo "A and Z Are created"
ip link add eth0-A type veth peer name veth-A ;
ip link set eth0-A netns A ;
ip link ;
ip netns exec A ip link ;

ovs-vsctl add-port OVS1 veth-A ;
ip link add eth0-Z type veth peer name veth-Z ;

ovs-vsctl add-port OVS1 veth-Z ;
ip link set veth-A up ;

ip netns exec A ip link set dev lo up ;
ip netns exec A ip link set dev eth0-A up ;
ip netns exec A ip address add 10.0.0.1/24 dev eth0-A ;

ip link set dev veth-Z up ;
ip netns exec Z bash ;
ip link set dev lo up ;
ip link set dev eth0-Z up ;
ip address add 10.0.0.2/24 dev eth0-Z ;
ip netns exec A bash
