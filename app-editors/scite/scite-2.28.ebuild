# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-editors/scite/scite-2.28.ebuild,v 1.1 2011/08/13 15:55:04 nelchael Exp $

EAPI="4"

inherit toolchain-funcs eutils

MY_PV=${PV//./}
DESCRIPTION="A very powerful editor for programmers"
HOMEPAGE="http://www.scintilla.org/SciTE.html"
SRC_URI="mirror://sourceforge/scintilla/${PN}${MY_PV}.tgz"

LICENSE="Scintilla"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-fbsd"
IUSE="lua"

RDEPEND="x11-libs/gtk+:2
	lua? ( >=dev-lang/lua-5 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	>=sys-apps/sed-4"

S="${WORKDIR}/${PN}/gtk"

src_prepare() {
	cd "${WORKDIR}/scintilla/gtk"
	sed -i makefile \
		-e "s#^CXXFLAGS=#CXXFLAGS=${CXXFLAGS} #" \
		-e "s#^\(CXXFLAGS=.*\)-Os#\1#" \
		-e "s#^CC =\(.*\)#CC = $(tc-getCXX)#" \
		-e "s#-Os##" \
		|| die "error patching makefile"

	cd "${WORKDIR}/scite/gtk"
	sed -i makefile \
		-e "s#-rdynamic#-rdynamic ${LDFLAGS}#" \
		|| die "error patching makefile"

	cd "${S}"
	sed -i makefile \
		-e 's#usr/local#usr#g' \
		-e 's#/gnome/apps/Applications#/applications#' \
		-e "s#^CXXFLAGS=#CXXFLAGS=${CXXFLAGS} #" \
		-e "s#^\(CXXFLAGS=.*\)-Os#\1#" \
		-e "s#^CC =\(.*\)#CC = $(tc-getCXX)#" \
		-e 's#${D}##' \
		-e 's#-g root#-g 0#' \
		-e "s#-Os##" \
		|| die "error patching makefile"
	cd "${WORKDIR}"
	epatch "${FILESDIR}/${PN}-2.28-no-lua.patch"
}

src_compile() {
	emake -j1 -C ../../scintilla/gtk
	if use lua; then
		emake
	else
		emake NO_LUA=1
	fi
}

src_install() {
	dodir /usr/bin
	dodir /usr/share/{pixmaps,applications}

	emake -j1 prefix="${D}/usr" install

	# we have to keep this because otherwise it'll break upgrading
	mv "${D}/usr/bin/SciTE" "${D}/usr/bin/scite" || die
	dosym /usr/bin/scite /usr/bin/SciTE

	# replace .desktop file with our own working version
	rm -f "${D}/usr/share/applications/SciTE.desktop" || die
	insinto /usr/share/applications
	doins "${FILESDIR}/scite.desktop"

	doman ../doc/scite.1
	dodoc ../README
}
