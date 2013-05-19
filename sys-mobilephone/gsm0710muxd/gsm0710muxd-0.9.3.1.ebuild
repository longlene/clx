# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The FreeSmartPhone.org GSM multiplexer"
HOMEPAGE="http://www.freesmartphone.org"
SRC_URI="http://www.freesmartphone.org/sources/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND=">=dev-libs/glib-2.10
         dev-libs/dbus-glib"
DEPEND=""

src_install() {
	cd "${S}"

	emake DESTDIR="${D}" install || die

	# Install the start/stop script
	newinitd "${FILESDIR}"/gsm0710muxd gsm0710muxd

	# Install the udev rules for serial devices of the Samsung SoC
	install -D -m 644 "${FILESDIR}"/99-gsm0710muxd.rules "${D}/etc/udev/rules.d/99-gsm0710muxd.rules"
}

pkg_postinst() {
	elog "To start the GSM multiplexer by default"
	elog "you should add it to the default runlevel:"
	elog "\`rc-update add gsm0710muxd default\`"
	ewarn "You need to restart udev before using ${PN}!"
}
