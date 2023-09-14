# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lisp implementation"
HOMEPAGE="https://github.com/nptcl/npt"
SRC_URI="https://github.com/nptcl/npt/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	cp build/Makefile.linux_release Makefile
}

src_install() {
	dobin npt
	dodoc README.md
}
