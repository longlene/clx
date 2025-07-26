# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fee32259fdcb7d829774d39138df836ba47cd566"

DESCRIPTION="A new user interface protocol and toolkit implementation"
HOMEPAGE="https://github.com/Shirakumo/alloy"
SRC_URI="https://github.com/Shirakumo/alloy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/trivial-extensible-sequences
	dev-lisp/array-utils
	dev-lisp/float-features
	dev-lisp/global-vars
	dev-lisp/closer-mop
"
BDEPEND=""
