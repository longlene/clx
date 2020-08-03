# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c1ecdf86f3fc731dc19bf462daccdbcd933c4910"

DESCRIPTION="Automatic differentiation library for Common Lisp"
HOMEPAGE="https://github.com/mobius-eng/cl-ad"
SRC_URI="https://github.com/mobius-eng/cl-ad/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm ${PN}-tests.{asd,lisp}
}
