# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="fakehermes: protects against spam with a fake smtp server"
HOMEPAGE="http://www.hermes-project.com/pages/fakehermes"
SRC_URI="http://www.hermes-project.com/files/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="spf"

DEPEND="spf? (mail-filter/libspf2)"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd ${S}
	DOMAINNAME=$(hostname -f)
	sed -e "s/#define DOMAIN \"localhost\"/#define DOMAIN \"$DOMAINNAME\"/" config.h.example > config.h
}

src_compile() {
	if use spf; then
	  emake SPF=1
	else
	  emake
	fi
}

src_install() {
	emake DESTDIR=${D} install || die "make install failed"
	mkdir -p ${D}/etc/init.d
	install -m755 dists/gentoo_init ${D}/etc/init.d/fakehermes
	einfo
	einfo "this ebuild configures fakehermes to use port 25 and sets DOMAIN to"
	einfo "your current domainname"
	einfo
	einfo "use with care. fakehermes started on the wrong server can delay your"
	einfo "email indefinitely"
	einfo
}
