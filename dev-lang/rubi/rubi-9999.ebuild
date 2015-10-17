# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Ruby-like high-performance script programming language with JIT compiler"
HOMEPAGE="https://github.com/embedded2015/rubi"
SRC_URI=""

EGIT_REPO_URI="https://github.com/embedded2015/rubi.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin rubi
	dodoc README.md
}
