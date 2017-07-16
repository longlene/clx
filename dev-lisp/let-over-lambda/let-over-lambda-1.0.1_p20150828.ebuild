# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="481b2e3ab4646186451dfdd2062113203287d520"

DESCRIPTION="code from letoverlambda.com"
HOMEPAGE="https://github.com/thephoeron/let-over-lambda"
SRC_URI="https://github.com/thephoeron/let-over-lambda/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/named-readtables
	test? ( dev-lisp/prove )
"

src_prepare() {
		eapply_user
		use test || rm -r ${PN}-test.asd
}
