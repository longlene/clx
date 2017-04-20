# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5b869c1dbb13c62bf533ee1bccb86e21bf45edcc"

DESCRIPTION="A Resque clone in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/lesque"
SRC_URI="https://github.com/fukamachi/lesque/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/cl-redis
	dev-lisp/yason
	dev-lisp/local-time
	dev-lisp/trivial-backtrace
	dev-lisp/log4cl
	dev-lisp/alexandria
"

src_prepare() {
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
