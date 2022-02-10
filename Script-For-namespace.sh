#ip link comment
#ip a
#ip route
ip netns add red
ip netns add green
#ip netns
# ls /var/run/netns
#delete ip netns del red
#ip netns exec red ip link
#ip netns exec green ip link
ovs-vsctl add-br OVS1
#ovs-vsctl show
#ip link
ip link add eth0-r type veth peer name veth-r
#ip link
ip link set eth0-r netns red
ip link
#ip netns exec red ip link
ovs-vsctl add-port OVS1 veth-r
#ovs-vsctl show
ip link add eth0-g type veth peer name veth-g
ip link set eth0-g netns green
ovs-vsctl add-port OVS1 veth-g
ip link
ip link set veth-r up
ip link
ip netns exec red ip link set dev lo up
ip netns exec red ip link set dev eth0-r up
ip netns exec red ip address add 10.0.0.3/24 dev eth0-r
ip netns exec red ip a
ip netns exec red ip route
ip route
ip link set dev veth-g up
ip netns exec green bash
ip link set dev lo up
ip link set dev eth0-g up
ip address add 10.0.0.4/24 dev eth0-g
ip a
ip netns exec red bash
#ping
Exit
