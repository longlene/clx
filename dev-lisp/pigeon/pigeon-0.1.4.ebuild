# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="s-exp based python"
HOMEPAGE="https://github.com/lepisma/pigeon"
SRC_URI="https://github.com/lepisma/pigeon/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/cl-cut
	dev-lisp/cl-interpol
	dev-lisp/cl-strings
"
BDEPEND=""
