# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A truly extensible version of DEFCLASS"
HOMEPAGE="https://github.com/Hexstream/enhanced-defclass"
SRC_URI="https://github.com/Hexstream/enhanced-defclass/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/evaled-when
	dev-lisp/simple-guess
	dev-lisp/shared-preferences
	dev-lisp/compatible-metaclasses
	dev-lisp/enhanced-eval-when
	dev-lisp/enhanced-find-class
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -rf test
}
