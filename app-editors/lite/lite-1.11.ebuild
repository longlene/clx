# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lightweight text editor written in Lua"
HOMEPAGE="https://github.com/rxi/lite"
SRC_URI="https://github.com/rxi/lite/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/libsdl2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	./build.sh || die "compile failed"
}

src_install() {
	dobin lite
	dodoc README.md
}

