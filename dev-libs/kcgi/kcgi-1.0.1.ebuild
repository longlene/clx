# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="minimal CGI and FastCGI library in C"
HOMEPAGE="https://kristaps.bsd.lv/kcgi"
SRC_URI="https://github.com/kristapsdz/kcgi/archive/VERSION_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

BDEPEND="
	virtual/pkgconfig
"
DEPEND="
	app-crypt/libmd
	dev-build/bmake
	dev-libs/libbsd
"
RDEPEND="
	${DEPEND}
	virtual/zlib
"

src_prepare() {
	eapply_user
}

src_configure() {
	./configure \
		PREFIX="${EPREFIX}/usr" \
		LIBDIR="${EPREFIX}/usr/$(get_libdir)" \
		MANDIR="${EPREFIX}/usr/share/man" \
		CFLAGS="${CFLAGS} $(pkg-config --cflags libbsd-overlay)" \
		LDFLAGS="$(pkg-config --libs libbsd-overlay)" || die
}

src_compile() {
	bmake
}

src_install() {
	bmake install DESTDIR="${D}"
}
