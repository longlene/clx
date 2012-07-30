# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Hotkey driver for some Acer and Acer-like laptops"
HOMEPAGE="http://www.roessner-net.com/wlan-button/"
SRC_URI="http://www.roessner-net.com/wlan-button/${PN}-${PV}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE="acerhk debug"
SLOT="0"

DEPEND="sys-fs/sysfsutils
		=dev-libs/libxml2-2*"

RDEPEND="acerhk? ( app-laptop/acerhk )"

src_unpack() {
	unpack ${A}

	use debug && sed -i -e "s:# -D_DEBUG:-D_DEBUG:" ${S}/Makefile
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install
	dodoc README
	doman wlan-button.8 wlan-button.conf.5
	insinto /etc
	doins wlan-button.conf
	newinitd ${FILESDIR}/wlan-button.init wlan-button
}

pkg_postinst() {
	einfo "Attention! Major changes have been made since version 1.50,"
	einfo "so please check the config file."
	einfo
	einfo "A sample configuration is in /etc/wlan-button.conf. Adapt it"
	einfo "to your needs. See wlan-button.conf(5) for more information"
}

