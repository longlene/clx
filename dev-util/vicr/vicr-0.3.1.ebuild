# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

DESCRIPTION="Vim-like Interactive CRystal"
HOMEPAGE="https://github.com/veelenga/vicr"
SRC_URI="https://github.com/veelenga/vicr/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/crystal"
RDEPEND="${DEPEND}
	|| ( app-editors/vim app-editors/gvim )
"

src_install() {
	dobin out/vicr
	dodoc README.md
}
