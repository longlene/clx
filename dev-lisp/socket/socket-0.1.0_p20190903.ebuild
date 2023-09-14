# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7cf9e1fa24cf0ae86c3d1d80ab732225244c760e"

DESCRIPTION="sb-bsd-sockets replacement for SBCL"
HOMEPAGE="https://github.com/mateuszb/socket"
SRC_URI="https://github.com/mateuszb/socket/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "socket\/tests/,$' ${PN}.asd
		rm -r tests
	fi
}
