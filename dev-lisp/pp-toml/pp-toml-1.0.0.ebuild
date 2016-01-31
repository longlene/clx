# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Common Lisp TOML parser"
HOMEPAGE="https://github.com/pnathan/pp-toml"
SRC_URI="mirror://github/pnathan/pp-toml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/generic-comparability
	dev-lisp/local-time
	dev-lisp/parse-number
	dev-lisp/split-sequence
	dev-lisp/esrap
"

src_prepare() {
	use test || rm pp-toml-tests.{asd,lisp} pp-toml-wrapper.lisp
}
