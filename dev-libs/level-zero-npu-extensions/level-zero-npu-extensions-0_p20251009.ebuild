# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="61e4aeb00afd2a5b6955986269eed3a713c7b562"

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
