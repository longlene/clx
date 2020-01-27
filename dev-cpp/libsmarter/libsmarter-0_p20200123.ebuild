# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_COMMIT="bf8fd32dcc12e3c125940924e8466bb3a096be93"

DESCRIPTION="More powerful reference-counting smart pointers for C++"
HOMEPAGE="https://github.com/avdgrinten/libsmarter"
SRC_URI="https://github.com/avdgrinten/libsmarter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins include/smarter.hpp
}
