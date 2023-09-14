# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="278cb4116d3f68d7051d81a784dbb564ef150d11"

DESCRIPTION="Error pattern for assertion libraries in Common Lisp"
HOMEPAGE="https://github.com/noloop/assertion-error"
SRC_URI="https://github.com/noloop/assertion-error/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dissect
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :assertion-error\/test/d' ${PN}.asd
		rm -r test
	fi
}
