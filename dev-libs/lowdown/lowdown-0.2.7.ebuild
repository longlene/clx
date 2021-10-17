# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="simple markdown translator"
HOMEPAGE="https://kristaps.bsd.lv/lowdown"
SRC_URI="https://github.com/kristapsdz/lowdown/archive/VERSION_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	cat >configure.local <<EOF
PREFIX=/usr
LIBDIR=/usr/$(get_libdir)
MANDIR=/usr/share/man
EOF
}

src_configure() {
	./configure || die
}
