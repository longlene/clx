# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="84c96b6fcce1ad785581c188b4d7a543fa033a03"

DESCRIPTION="Yet another HTTP client for Common Lisp"
HOMEPAGE="http://ultra.wikia.com/wiki/Dexador"
SRC_URI="https://github.com/fukamachi/dexador/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/fast-http
	dev-lisp/quri
	dev-lisp/fast-io
	dev-lisp/babel
	dev-lisp/trivial-gray-streams
	dev-lisp/chunga
	dev-lisp/cl-ppcre
	dev-lisp/cl-cookie
	dev-lisp/trivial-mimes
	dev-lisp/chipz
	dev-lisp/cl-base64
	dev-lisp/cl-reexport
	dev-lisp/cl-plus-ssl
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	test? ( dev-lisp/prove dev-lisp/lack dev-lisp/clack-test )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}