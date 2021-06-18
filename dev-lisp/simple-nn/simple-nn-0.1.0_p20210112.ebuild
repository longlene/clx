# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb4f54a85bb063f4a279f5366b6532283ee9744f"

DESCRIPTION="simple multi-layer neural network"
HOMEPAGE="https://github.com/masatoi/simple-nn"
SRC_URI="https://github.com/masatoi/simple-nn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "simple-nn\/tests/,$d' ${PN}.asd
}
