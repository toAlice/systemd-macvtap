# systemd-macvtap
Setup 2 MACVTAP interfaces with systemd-networkd. Tested on Arch Linux 5.16.5-arch1-1

## Usage
sudo make

## Configuration
Configure physical interface in macvtap-interface.network

(Optional) Add MAC address in `macvtap0.netdev` and `macvtap1.netdev`

## Tips
- Edit `macvtap-up@.service` if the interfaces are not brought up automatically.

- You may find the MAC Address in `/sys/class/net/macvtap0/address` and ifindex in `/sys/class/net/macvtap0/ifindex`
