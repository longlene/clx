# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b2568428193a512d141d6b615772d50ceb5f9bca"

DESCRIPTION="Algebraic data types in Common Lisp"
HOMEPAGE="https://github.com/stylewarning/cl-algebraic-data-type"
SRC_URI="https://github.com/stylewarning/cl-algebraic-data-type/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/global-vars
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all LICENSE.txt
}
