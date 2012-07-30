# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bash-completion

DESCRIPTION="Paco is a source code package organizer"
HOMEPAGE="http://paco.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE="gtk"

RDEPEND="gtk? ( =dev-cpp/gtkmm-2* )"

DEPEND="$RDEPEND
dev-util/pkgconfig
nls? ( sys-devel/gettext )"


src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	if use gtk;
	then
		econf || die "econf failed"
	else
		econf --disable-gpaco || die "econf failed"
	fi
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc AUTHORS BUGS ChangeLog README
	dobashcompletion scripts/paco_bash_completion
}

pkg_postinst() {
	bash-completion_pkg_postinst
}
