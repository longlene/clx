# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="6afe7f164ee1f0b2f4409849ad8b639af9350e3f"

DESCRIPTION="C++11 header-only HTTP sever library"
HOMEPAGE="https://github.com/yhirose/cpp-httplib"
SRC_URI="https://github.com/yhirose/cpp-httplib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins httplib.h
	dodoc README.md
}
	
