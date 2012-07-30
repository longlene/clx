# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion qt4 eutils

MY_PV="${PV/_beta/}"
ESVN_REPO_URI="http://${PN}.googlecode.com/svn/trunk/${PN/-/_}.${MY_PV}"
ESVN_PROJECT="${PN}"

DESCRIPTION="XSL Formatting Objects markup language WYSIWYG editor."
HOMEPAGE="http://code.google.com/p/${PN}/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND="dev-util/subversion
	dev-libs/libxslt
	dev-libs/libxml2
        >=x11-libs/qt-4.4"

S="${WORKDIR}/${PN/-/_}.${MY_PV}"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	econf --qtdir=/usr/$(get_libdir)/qt4 || die "configure failed!"

	emake || die "make failed!"
}

src_install() {
	dodoc CHANGELOG
	emake INSTALL_ROOT="${D}" install || die "make install failed!"
	doicon icon/foedit.png
}