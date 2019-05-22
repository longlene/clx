# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="72a51245e99443f58fad94d27d5be0c58846da85"

DESCRIPTION="A Common Lisp web application environment"
HOMEPAGE="https://github.com/Shirakumo/radiance"
SRC_URI="https://github.com/Shirakumo/radiance/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/modularize
	dev-lisp/modularize-hooks
	dev-lisp/modularize-interfaces
	dev-lisp/ubiquitous-concurrent
	dev-lisp/trivial-indent
	dev-lisp/cl-ppcre
	dev-lisp/trivial-mimes
	dev-lisp/local-time
	dev-lisp/lambda-fiddle
	dev-lisp/form-fiddle
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-utils
	dev-lisp/babel
	test? ( dev-lisp/parachute dev-lisp/alexandria dev-lisp/verbose )
"

src_prepare() {
	eapply_user
	use test || rm -r test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all static
}
