# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7408f6c69a5218e608558c17751d2f8a53979a3c"

DESCRIPTION="Common Lisp library that facilitates working with Common Lisp arrays"
HOMEPAGE="https://github.com/tpapp/array-operations"
SRC_URI="https://github.com/tpapp/array-operations/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/let-plus
	dev-lisp/optima
	dev-lisp/clunit
"
