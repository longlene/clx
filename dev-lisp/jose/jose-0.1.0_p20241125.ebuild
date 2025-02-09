# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0543b909265bb25ba827adf3a08bb739fe9ec591"

DESCRIPTION="A JOSE implementation"
HOMEPAGE="https://github.com/fukamachi/jose"
SRC_URI="https://github.com/fukamachi/jose/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-base64
	dev-lisp/trivial-utf8
	dev-lisp/ironclad
	dev-lisp/cl-json
	dev-lisp/split-sequence
	dev-lisp/assoc-utils
	dev-lisp/alexandria
	test? ( dev-lisp/rove )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "jose\/tests/,$d' jose.asd
		rm -r tests
	fi
}
