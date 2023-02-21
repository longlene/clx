# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c0a71f515b037b7c489f99914ac69d14d5ef23c"

DESCRIPTION="In-Memory Immutable Graph Structure with Datalog Query Language"
HOMEPAGE="https://github.com/inconvergent/cl-grph"
SRC_URI="https://github.com/inconvergent/cl-grph/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/veq
	dev-lisp/fset
	dev-lisp/alexandria
	dev-lisp/lparallel
"
BDEPEND=""
