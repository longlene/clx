# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The SHR framework phonegui for the EFL libraries."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

PROJECT_NAME="${PN}"
EGIT_TREE="006e605fb6ba1999c8a8b1b87a57cd28637c99a8"

RDEPEND="dev-libs/dbus-glib
		 x11-libs/ecore
		 x11-libs/elementary
		 sys-mobilephone/libframeworkd-glib
		 sys-mobilephone/libframeworkd-phonegui"
DEPEND="dev-libs/dbus-glib
		media-libs/edje"
inherit shr

src_unpack() {
	shr_src_unpack
	sed -i -e "s|@MSGFMT_OPTS@||" po/Makefile.in.in "${S}/${PROJECT_NAME}"/po/Makefile.in.in
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

