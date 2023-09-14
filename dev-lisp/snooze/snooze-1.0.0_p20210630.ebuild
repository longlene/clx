# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a84d44efce5d9f8b0e3916ea137dc3d43a561944"

DESCRIPTION="Common Lisp RESTful web development"
HOMEPAGE="https://github.com/capitaomorte/snooze"
SRC_URI="https://github.com/capitaomorte/snooze/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/quri
	dev-lisp/uiop
	dev-lisp/parse-float
	dev-lisp/rfc2388

	test? (
			dev-lisp/fiasco
			dev-lisp/cl-who
			dev-lisp/cl-fad
			dev-lisp/cl-css
			dev-lisp/hunchentoot
			dev-lisp/cl-json
			dev-lisp/local-time
			dev-lisp/local-time-duration
	)
"

src_prepare() {
	if use test ; then
		sed -i '/defsystem\ snooze-tests/,$ d' snooze.asd
		rm -r demo snooze-tests.lisp
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION
}
