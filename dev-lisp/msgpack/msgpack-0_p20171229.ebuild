# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4ce4aa738bf6bd8ee226b3d4427b6a796f008094"

DESCRIPTION=""
HOMEPAGE="https://github.com/cxxxr/msgpack"
SRC_URI="https://github.com/cxxxr/msgpack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ieee-floats
	dev-lisp/babel
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem "msgpack-test"/,$d' ${PN}.asd
		rm -r test
	fi
}
