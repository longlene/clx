# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A small C11 compiler in C++11"
HOMEPAGE="https://github.com/wgtdkp/wgtcc"
SRC_URI="https://github.com/wgtdkp/wgtcc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake all
}

src_install() {
	dobin build/wgtcc
	dodoc README.md
}
