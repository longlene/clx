# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="SimHash algorithm library for Chinese documents"
HOMEPAGE="https://github.com/yanyiwu/simhash"
SRC_URI="https://github.com/yanyiwu/simhash/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-cpp/cppjieba"

RESTRICT="test"

src_install() {
	doheader -r include/simhash
	dodoc README.md
}
