# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic vcs-snapshot

EGIT_COMMIT="2154d6d46eebac2f42dcce77f3f77ce0008b4a46"

DESCRIPTION="C++ client for Redis"
HOMEPAGE="https://github.com/brianwatling/redispp"
SRC_URI="https://github.com/brianwatling/redispp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	append-cxxflags '-std=c++11'
}

src_compile() {
	emake libredispp.so
}

src_install() {
	dolib.so libredispp.so
	insinto /usr/include
	doins src/redispp.h
	dodoc README.md
}
