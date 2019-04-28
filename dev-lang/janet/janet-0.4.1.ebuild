# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A dynamic language and bytecode vm"
HOMEPAGE="https://janet-lang.org/"
SRC_URI="https://github.com/janet-lang/janet/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

export JANET_BUILD='\"local\"'

src_install() {
	PREFIX="${D}"/usr emake install
}
