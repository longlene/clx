# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Calculate your BMI. BMI is the scale doctors use to calculate the amount of fat on your body in relationship to your length."
HOMEPAGE="http://www.ibiblio.org/bmi/"
SRC_URI="http://www.ibiblio.org/bmi/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="x11-misc/xdialog
	dev-util/dialog"

DEPEND="${RDEPEND}
	>=sys-apps/sed-4"

src_unpack() {
	unpack ${A}
	cd ${S}

	sed -i \
		-e "s:-g::;s:-O1:${CXXFLAGS}:" \
		src/Makefile.am || die "sed Makefile.am failed"
}

src_install() {
	make DESTDIR=${D} install-exec install-man || die
	dodoc AUTHORS ChangeLog README
}