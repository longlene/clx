# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="eebdc32a2dd19d8f4d56222473dd25f746d70eda"

DESCRIPTION="A Common Lisp library for handling Web API requests and responses"
HOMEPAGE="https://github.com/fukamachi/apispec"
SRC_URI="https://github.com/fukamachi/apispec/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-utilities
	dev-lisp/alexandria
	dev-lisp/assoc-utils
	dev-lisp/cl-yaml
	dev-lisp/trivial-cltl2
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/jonathan
	dev-lisp/fast-http
	dev-lisp/quri
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "apispec\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
