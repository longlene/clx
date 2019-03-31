# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="minimalistic X11 window manager"
HOMEPAGE="https://github.com/jorisvink/coma"
SRC_URI="https://github.com/jorisvink/coma/archive/${PV}-release.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '2iCFLAGS=-D_GNU_SOURCE' \
		-e '2iLDFLAGS=-lbsd' \
		-i Makefile
}

src_install() {
	dobin coma
	doman coma.1
	dodoc README.md
}
