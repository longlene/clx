# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="585b107ce442da30e3797f922b53c2454d34b7c1"

DESCRIPTION="A tiny Unix dynamic memory allocator library"
HOMEPAGE="https://github.com/NanXiao/umalloc"
SRC_URI="https://github.com/NanXiao/umalloc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libumalloc.so
	insinto /usr/include
	doins umalloc.h
	dodoc README.md
}
