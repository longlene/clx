# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit toolchain-funcs

DESCRIPTION="FXP.One is a very flexible FTP/FXP engine."
HOMEPAGE="http://www.lundman.net/wiki/index.php/FXP.One"
SRC_URI="http://www.lundman.net/ftp/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ncurses"

DEPEND="
	dev-libs/openssl
	ncurses? ( >=dev-libs/cdk-5.0.20060507 )
"

src_compile() {
	# this is an ugly hack around fxp.one's automagic deps on cdk/ncurses
	use ncurses || export ac_cv_cdk_dir=no cdk_found=no ac_cv_curses_dir=no curses_found=no
	econf || die "econf died"
	emake DESTDIR="${D}" || die "emake died"
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc README.txt
}
