# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d2631079be104f52d7e58ffbd9905d6a0d8f6ef"

DESCRIPTION="Autowrapping FFI"
HOMEPAGE="https://github.com/borodust/claw"
SRC_URI="https://github.com/borodust/claw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/uiop
	dev-lisp/trivial-features
"
