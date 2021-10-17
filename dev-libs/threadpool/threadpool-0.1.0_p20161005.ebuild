# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="169d20f326772492a836c0d2acd6d1de985f002d"

DESCRIPTION="A simple C Thread pool implementation"
HOMEPAGE="https://github.com/mbrossard/threadpool"
SRC_URI="https://github.com/mbrossard/threadpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libthreadpool.so
	insinto /usr/include
	doins src/threadpool.h
	dodoc README.md
}
