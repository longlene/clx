# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="566b51a005e81ff618554b9b2f0b795d3b29398d"

DESCRIPTION="A library for converting values of type FLOAT and DOUBLE-FLOAT to and from their binary representation as defined by IEEE 754."
HOMEPAGE="http://common-lisp.net/project/ieee-floats/"
SRC_URI="https://github.com/marijnh/ieee-floats/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="test"

RDEPEND="test? ( dev-lisp/fiveam )"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem :ieee-floats-tests/,$d' ${PN}.asd
		rm tests.lisp
	fi
}
