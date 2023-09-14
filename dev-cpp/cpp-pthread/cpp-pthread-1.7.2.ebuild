# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic

DESCRIPTION="C++ wrapper of the pthread library"
HOMEPAGE="https://github.com/HerbertKoelman/cpp-pthread"
SRC_URI="https://github.com/HerbertKoelman/cpp-pthread/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	append-cppflags -std=c++11
}

src_install() {
	insinto /usr
	doins -r include
	dolib.a lib/libcpp-pthread.a
	dodoc README.md
}
