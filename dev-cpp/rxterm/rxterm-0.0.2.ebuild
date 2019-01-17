# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Functional reactive terminals in C++"
HOMEPAGE="https://github.com/loopperfect/rxterm"
SRC_URI="https://github.com/LoopPerfect/rxterm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/rxterm
	doins -r rxterm/include/{components,image.hpp,pixel.hpp,reflow.hpp,style.hpp,terminal.hpp,utils.hpp}
	dodoc README.md
}
