# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ec34f001e8b34eab54b32e31dbb386a106d4d53f"

DESCRIPTION="Autowrapping FFI"
HOMEPAGE="https://github.com/borodust/claw"
SRC_URI="https://github.com/borodust/claw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/named-readtables
	dev-lisp/claw-utils
	dev-lisp/cl-resect
	dev-lisp/parse-number
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/float-features
"

