# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="29ff94b484c90c976ce2e74b629b89bb27c2c3b7"

DESCRIPTION="Resilient replicant Shell Programming Library for Common Lisp"
HOMEPAGE="https://github.com/foretspaisibles/cl-rashell"
SRC_URI="https://github.com/foretspaisibles/cl-rashell/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/parse-float
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:rashell\/test/,$d' ${PN}.asd
}
