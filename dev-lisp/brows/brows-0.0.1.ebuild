# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="urlview in common lisp"
HOMEPAGE="https://github.com/sjl/brows"
SRC_URI="https://github.com/sjl/brows/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/boots
	dev-lisp/cl-ppcre
	dev-lisp/deploy
	dev-lisp/external-program
	dev-lisp/iterate
	dev-lisp/cl-losh
"
