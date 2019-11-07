# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Mutabah's Rust Compiler"
HOMEPAGE="https://github.com/thepowersgang/mrustc"
SRC_URI="https://github.com/thepowersgang/mrustc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin bin/mrustc
	dodoc README.md
}
