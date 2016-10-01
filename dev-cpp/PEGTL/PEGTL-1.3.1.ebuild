# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Parsing Expression Grammar Template Library"
HOMEPAGE="https://github.com/ColinH/PEGTL"
SRC_URI="https://github.com/ColinH/PEGTL/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins -r pegtl{,.hh}
	dodoc README.md
}
