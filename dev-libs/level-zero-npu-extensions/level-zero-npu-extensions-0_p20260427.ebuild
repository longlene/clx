# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="f9ad3bf89c2418d714aef2e6b96a5aafb12a1971"

DESCRIPTION="NPU level zero extensions headers"
HOMEPAGE="https://github.com/intel/level-zero-npu-extensions"
SRC_URI="https://github.com/intel/level-zero-npu-extensions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-libs/level-zero
"

src_install() {
	insinto /usr/include/level_zero
	doins ze_*.h
	einstalldocs
}
