# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ce553b8764b26a23b0052272a255f35f93776fa"

DESCRIPTION="A general, modular build system"
HOMEPAGE="https://github.com/Shinmera/forge"
SRC_URI="https://github.com/Shinmera/forge/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/forge-support
	dev-lisp/forge-communication
	dev-lisp/closer-mop
	dev-lisp/promise
	dev-lisp/cl-ppcre
	dev-lisp/usocket
	dev-lisp/documentation-utils
	dev-lisp/pathname-utils
	dev-lisp/bordeaux-threads
	dev-lisp/verbose
	dev-lisp/alexandria
	dev-lisp/ironclad
	dev-lisp/cffi
"
BDEPEND=""
