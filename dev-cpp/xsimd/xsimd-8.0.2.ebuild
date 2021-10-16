# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++ wrappers for SIMD intrinsics"
HOMEPAGE="https://github.com/quantstack/xsimd"
SRC_URI="https://github.com/QuantStack/xsimd/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/xsimd
	dodoc README.md
}
