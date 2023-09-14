# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9ef7039d610b610c9b0496bc133dbc00f18c0b36"

DESCRIPTION="Network event library for Common Lisp"
HOMEPAGE="https://github.com/mateuszb/reactor"
SRC_URI="https://github.com/mateuszb/reactor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "reactor\/test/,$d' ${PN}.asd
		rm -r tests
	fi
}
