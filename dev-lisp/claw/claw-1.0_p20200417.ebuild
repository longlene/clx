# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3cd4a96fca95eb9e8d5d069426694669f81b2250"

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
	dev-lisp/cffi
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/trivial-features
	dev-lisp/sha1
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :claw\/tests/,$' ${PN}.asd
		rm -r t
	fi
}
