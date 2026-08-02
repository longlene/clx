# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LIMONP_PV="1.0.2"

DESCRIPTION="The Jieba Chinese Word Segmentation Implemented By C++"
HOMEPAGE="https://github.com/yanyiwu/cppjieba"
SRC_URI="
	https://github.com/yanyiwu/cppjieba/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/yanyiwu/limonp/archive/refs/tags/v${LIMONP_PV}.tar.gz
		-> limonp-${LIMONP_PV}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	cp -a "${WORKDIR}/limonp-${LIMONP_PV}/." "${S}/deps/limonp/" || die
	default
}

src_install() {
	doheader -r include/cppjieba
	doheader -r deps/limonp/include/limonp
	insinto /usr/share/cppjieba
	doins -r dict
	dodoc README.md
}
