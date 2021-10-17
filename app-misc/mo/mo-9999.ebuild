# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="Mustache templates in pure bash"
HOMEPAGE="https://github.com/tests-always-included/mo"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tests-always-included/mo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin mo
	dodoc README.md API.md
}
