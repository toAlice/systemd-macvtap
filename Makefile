all: install enable

install:
	install -m 644 macvtap0.netdev -t ${pkgdir}/etc/systemd/network/ 
	install -m 644 macvtap1.netdev -t ${pkgdir}/etc/systemd/network/
	install -m 644 macvtap.mtu.network -t ${pkgdir}/etc/systemd/network/
	install -m 644 macvtap-interface.network -t ${pkgdir}/etc/systemd/network/
	install -m 644 macvtap-up@.service -t ${pkgdir}/usr/lib/systemd/system/

enable:
	systemctl enable systemd-networkd.service
	systemctl enable macvtap-up@macvtap0.service
	systemctl enable macvtap-up@macvtap1.service

uninstall:
	systemctl disable macvtap-up@macvtap0.service
	systemctl disable macvtap-up@macvtap1.service
	rm -f ${pkgdir}/etc/systemd/network/macvtap0.netdev
	rm -f ${pkgdir}/etc/systemd/network/macvtap1.netdev
	rm -f ${pkgdir}/etc/systemd/network/macvtap.mtu.network
	rm -f ${pkgdir}/etc/systemd/network/macvtap-interface.network
	rm -f ${pkgdir}/usr/lib/systemd/system/macvtap-up@.service
#	systemctl disable systemd-networkd.service
