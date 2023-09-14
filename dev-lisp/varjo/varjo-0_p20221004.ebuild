# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7949aa6e07cbecfaeec6fc7b8f479bc0dcfcfc44"

DESCRIPTION="Lisp to GLSL Language Translator"
HOMEPAGE="https://github.com/cbaggers/varjo"
SRC_URI="https://github.com/cbaggers/varjo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/alexandria
	dev-lisp/named-readtables
	dev-lisp/vas-string-metrics
	dev-lisp/fn
	dev-lisp/uiop
	dev-lisp/rtg-math
	dev-lisp/glsl-spec
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.tests.asd tests
}
