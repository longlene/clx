# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A structure and some facilities for an abstract-array structure in Common Lisp"
HOMEPAGE="https://github.com/digikar99/abstract-arrays"
SRC_URI="https://github.com/digikar99/abstract-arrays/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/polymorphic-functions
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/introspect-environment
	dev-lisp/trivial-types
"
BDEPEND=""
