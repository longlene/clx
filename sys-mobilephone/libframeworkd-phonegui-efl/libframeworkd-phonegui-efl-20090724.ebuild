# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit shr

PROJECT_NAME="${PN}"
EGIT_TREE="d39cea7ab6be525b4125b06a44b6ce5df2af3dc1"

DESCRIPTION="The SHR framework phonegui for the EFL libraries."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

RDEPEND="dev-libs/dbus-glib
	x11-libs/ecore
	x11-libs/elementary
	x11-libs/etk
	sys-mobilephone/libframeworkd-glib
	sys-mobilephone/libframeworkd-phonegui"
DEPEND="dev-libs/dbus-glib
	media-libs/edje"

src_unpack() {
	shr_src_unpack
	sed -i -e "s|@MSGFMT_OPTS@||" po/Makefile.in.in "${S}/${PROJECT_NAME}"/po/Makefile.in.in
	sed -i -e "s|@E_LIBS@|@E_LIBS@ -lelementary -letk|" src/Makefile.in
}


src_compile() {
	cd "${S}/${PROJECT_NAME}"
	econf --with-edje-cc=/usr/bin/edje_cc || die "econf failed"
	emake SUBDIRS="src data" || die "emake failed"
}

src_install() {
        cd "${S}/${PROJECT_NAME}"

        emake DESTDIR="${D}" SUBDIRS="src data" install || die "emake install failed"
        dodoc AUTHORS NEWS README
}

