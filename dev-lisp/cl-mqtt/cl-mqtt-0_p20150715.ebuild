# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1cbcfe1d799cd51c94950e913a0c6905084d6666"

DESCRIPTION="MQTT driver for cl-async"
HOMEPAGE="https://github.com/ivan4th/cl-mqtt"
SRC_URI="https://github.com/ivan4th/cl-mqtt/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/babel
	dev-lisp/i4-diet-utils
	dev-lisp/cl-async
	dev-lisp/blackbird
	dev-lisp/printv
	test? ( dev-lisp/vtf )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.tests.asd ${PN}-test.lisp interop-test.lisp
}
