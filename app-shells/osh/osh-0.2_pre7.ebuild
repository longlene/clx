# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

MY_PV=${PV/_/-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="Ole's Shell, a lightweight shell"
HOMEPAGE="http://osh.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

DEPEND="sys-libs/readline
	sys-libs/ncurses"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i 's/-ltermcap/-lncurses/g' Makefile || die "sed failed"
}

src_compile() {
	useq debug && DEFS="-DDEBUG"

	emake \
		CC=$(tc-getCC) \
		CFLAGS="${CFLAGS}" \
		LFLAGS="${LDFLAGS}" \
		DEFS="${DEFS}" \
		|| die "emake failed"
}

src_install() {
	exeinto /bin
	doexe osh || die "doexe failed"
	doman osh.1
	dodoc Changelog README TODO
}

pkg_postinst() {
	einfo "Updating /etc/shells"
	{ grep -v "^/bin/osh$" /etc/shells;
	echo "/bin/osh"
	} > ${T}/shells
	mv -f ${T}/shells /etc/shells
}

