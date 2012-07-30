# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit linux-mod linux-info eutils

DESCRIPTION="System Inactivity Notifier"
HOMEPAGE="http://www.c0nc3pt.com/index.php?id=12"
SRC_URI="mirror://sourceforge/sin/${P}.tbz"
LICENSE="GPL-3"

KEYWORDS="x86 amd64"
IUSE=""

DEPEND="sys-fs/udev"

MODULE_NAMES="sinmod(kernel/drivers/char:)"
BUILD_TARGETS="all"

pkg_setup() {
	linux-mod_pkg_setup
	kernel_is lt 2 6 22 && die 'requires at least 2.6.22 kernel version'
}

src_install() {
	linux-mod_src_install

	exeinto /usr/bin
	doexe gentable

	dodir /etc/sin

        exeinto /etc/sin
        doexe etc/sin/rules.sh
	doexe etc/sin/setup.sh

        insinto /etc/sin
	doins etc/sin/table.ac
	doins etc/sin/table.bat

        insinto /etc/udev/rules.d
        doins etc/udev/rules.d/99-sin.rules
}

pkg_postinst() {
        einfo ""
	elog "Sample scripts have been installed in /etc/sin"
        einfo ""
}
