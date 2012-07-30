# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils
DESCRIPTION="This is a minimalistic iconv library"

HOMEPAGE="http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/"

SRC_URI="http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/Makefile
http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/README
http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/iconv.c
http://tinderbox.dev.gentoo.org/portage/local/misc/mini-iconv/iconv.h"

LICENSE="as-is"

SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="!dev-libs/libiconv
	!sys-libs/glibc"
RDEPEND="${DEPEND}"

src_unpack() {
	cd ${DISTDIR}

	mkdir ${S}
	cp ${A} ${S}
}

src_compile() {
	tc-export CC

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ${S}/README
}
