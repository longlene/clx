# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2fdec2dbdef8ba2144139b27a7350d4cedc011a1"

DESCRIPTION="Events for Common Lisp"
HOMEPAGE="https://github.com/deadtrickster/cl-events"
SRC_URI="https://github.com/deadtrickster/cl-events/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/log4cl
	dev-lisp/lparallel
	dev-lisp/blackbird
	test? ( dev-lisp/prove dev-lisp/mw-equiv )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
