# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="76b75103f21ead092c9f715512fa82441ef61185"

DESCRIPTION="Yet another URI library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/quri"
SRC_URI="https://github.com/fukamachi/quri/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/cl-utilities
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown data/effective_tld_names.dat
}
	
	