# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="42768cc73e74f6d371bd9dd51b1860b07774e7ec"

DESCRIPTION="NPU level zero extensions headers"
HOMEPAGE="https://github.com/intel/level-zero-npu-extensions"
SRC_URI="https://github.com/intel/level-zero-npu-extensions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/level-zero
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	insinto /usr/include/level_zero
	doins ze_*.h
	einstalldocs
}
