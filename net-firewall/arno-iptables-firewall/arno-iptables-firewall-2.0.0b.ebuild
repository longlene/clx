# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Arno's iptables firewall script"
HOMEPAGE="http://rocky.eld.leidenuniv.nl/joomla/"
SRC_URI="http://rocky.eld.leidenuniv.nl/${PN}/${PN}_${PV}.tar.gz"

S=${WORKDIR}/${PN}_${PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+plugins"

RDEPEND=">=net-firewall/iptables-1.2.5 >=sys-apps/iproute2-2.6.35-r2"
DEPEND=""

inherit linux-info

pkg_pretend() {
	if use kernel_linux; then
		if [[ -e "${EROOT}usr/src/linux/.config" ]]; then
			CONFIG_CHECK="IP_NF_IPTABLES"
			check_extra_config
		fi
fi
}

src_install() {

	insinto /etc/arno-iptables-firewall

	sed -e 's:/usr/local/share/:/usr/share/:' \
		etc/arno-iptables-firewall/firewall.conf > \
		"${T}"/firewall.conf || die
	doins "${T}"/firewall.conf
	doins etc/arno-iptables-firewall/custom-rules

	sed -e 's:local/::' \
		contrib/Gentoo/firewall.conf > \
		"${T}"/arno-iptables-firewall.confd || die
	newconfd "${T}"/arno-iptables-firewall.confd arno-iptables-firewall
	newinitd contrib/Gentoo/rc.firewall arno-iptables-firewall

	dobin bin/arno-fwfilter
	dosbin bin/arno-iptables-firewall

	insinto /usr/share/arno-iptables-firewall/
	doins share/arno-iptables-firewall/environment

	if use plugins
	then
		insinto /etc/arno-iptables-firewall/plugins
		doins etc/arno-iptables-firewall/plugins/*

		insinto /usr/share/arno-iptables-firewall/plugins
		doins share/arno-iptables-firewall/plugins/*.plugin

		exeinto /usr/share/arno-iptables-firewall/plugins
		doexe share/arno-iptables-firewall/plugins/dyndns-host-open-helper

		doexe share/arno-iptables-firewall/plugins/traffic-accounting-helper
		doexe share/arno-iptables-firewall/plugins/traffic-accounting-log-rotate

		doexe share/arno-iptables-firewall/plugins/traffic-accounting-show

		docinto plugins
		dodoc share/arno-iptables-firewall/plugins/*.CHANGELOG
	fi

	dodoc CHANGELOG README

	doman share/man/man1/arno-fwfilter.1 \
		share/man/man8/arno-iptables-firewall.8

}

pkg_postinst () {
	elog "You will need to configure /etc/${PN}/firewall.conf before using this"
	elog "package.  To start the script, run:"
	elog "  /etc/init.d/${PN} start"
	echo
	elog "If you want to start this script at boot, run:"
	elog "  rc-update add ${PN} default"
	echo
	ewarn "When you start the firewall, the default is to,"
	ewarn "DROP ALL existing connections! So be carefull when installing"
	ewarn "on a remote host! There is a option to disable this behavior"
	ewarn "for testting."
	echo
	ewarn "When you stop this script, all firewall rules are flushed!"
	echo
}
