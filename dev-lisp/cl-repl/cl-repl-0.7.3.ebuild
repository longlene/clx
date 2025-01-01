# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A full-featured repl implementation designed to work with Roswell"
HOMEPAGE="https://github.com/koji-kojiro/cl-repl"
SRC_URI="https://github.com/lisp-maintainers/cl-repl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/unix-opts
	dev-lisp/cl-ppcre
	dev-lisp/cl-readline
"
