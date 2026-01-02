# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="84d793e0a98703c8c31d4e85cfe4d85839cb0f85"

DESCRIPTION="Micro QuickJS Javascript Engine"
HOMEPAGE="https://github.com/bellard/mquickjs"
SRC_URI="https://github.com/bellard/mquickjs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_install() {
	dobin mqjs
	einstalldocs
}
