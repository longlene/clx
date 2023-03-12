# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f4fb3f59b0844788613fc4d1cc0d2b08df9488bb"

DESCRIPTION="CLOS extension for context-oriented Programming"
HOMEPAGE="http://common-lisp.net/project/closer/"
SRC_URI="https://github.com/pcostanza/contextl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="
	dev-lisp/lw-compat
	>=dev-lisp/closer-mop-1.0.0
"

src_prepare() {
	default
	rm -rf test
}
