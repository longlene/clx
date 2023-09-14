# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="6866f9b62e27c5e712eed8cc86889cd7ea6d4679"

DESCRIPTION="wrapper library of iconv for C++"
HOMEPAGE="https://github.com/unnonouno/iconvpp"
SRC_URI="https://github.com/unnonouno/iconvpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="virtual/libiconv"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins iconv.hpp
	dodoc README.rst
}
