# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Single-file FLAC decoder with a push-style API"
HOMEPAGE="https://github.com/jprjr/miniflac"
SRC_URI="https://github.com/jprjr/miniflac/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="0BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake libminiflac.so miniflac.h
}

src_install() {
	insinto /usr/include
	doins miniflac.h
	dolib.so libminiflac.so
	einstalldocs
}
