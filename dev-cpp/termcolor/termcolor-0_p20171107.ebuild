# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="83bc3fbc9e6440202eaf46141bca15ea5bd53757"

DESCRIPTION="Termcolor is a header-only C++ library for printing colored messages to the terminal"
HOMEPAGE="https://github.com/ikalnytskyi/termcolor"
SRC_URI="https://github.com/ikalnytskyi/termcolor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins -r include/termcolor
	dodoc README.rst
}
