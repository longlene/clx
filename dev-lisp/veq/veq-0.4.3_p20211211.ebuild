# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="147e747826495be0b1d8db0c4c4f006c1000d30d"

DESCRIPTION="reasonably fast operations for 1d, 2d, 3d vectors"
HOMEPAGE="https://github.com/inconvergent/cl-veq"
SRC_URI="https://github.com/inconvergent/cl-veq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:veq\/tests/,$d' ${PN}.asd
	rm -rf test
}
