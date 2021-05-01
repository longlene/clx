# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Perfectstorm is a real time strategy game study written in Common Lisp"
HOMEPAGE="https://github.com/lispgames/perfectstorm"
SRC_URI="https://github.com/lispgames/perfectstorm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-opengl
	dev-lisp/cl-cairo2
	dev-lisp/infix
	dev-lisp/metabang-bind
	dev-lisp/closer-mop
"
