# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit common-lisp-3

DESCRIPTION="Python Itertools in Common Lisp"
HOMEPAGE="https://github.com/anlsh/picl"
SRC_URI="https://github.com/anlsh/picl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/defclass-std
	dev-lisp/alexandria
	dev-lisp/iterate
	test? (  dev-lisp/fiveam dev-lisp/generic-cl )
"
BDEPEND=""
