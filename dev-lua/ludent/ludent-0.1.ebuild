# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A primitive Lua indenter/formatter/beautfier"
HOMEPAGE="https://github.com/lipp/ludent"
SRC_URI="https://github.com/lipp/ludent/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin ludent
	dodoc README.md
}
