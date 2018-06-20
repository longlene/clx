# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="16b251f13f37a1222ad101a5b2c8ac98398d1d32"

DESCRIPTION="A common lisp implementation of rfc2388"
HOMEPAGE="https://github.com/AccelerationNet/rfc2388"
SRC_URI="https://github.com/AccelerationNet/rfc2388/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -rf test
		sed -i '/defsystem :rfc2388.test/,$d' ${PN}.asd
	fi
}
