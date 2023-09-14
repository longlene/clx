# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a4483af16c4d1a9bbd9d562ae48941cfa97bca9c"

DESCRIPTION="Usable wrapper over the Olm C bindings"
HOMEPAGE="https://github.com/K1D77A/cl-megolm/"
SRC_URI="https://github.com/K1D77A/cl-megolm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/claw-olm
	dev-lisp/jonathan
	dev-lisp/cffi
	dev-lisp/lisp-unit
	dev-lisp/s-base64
	dev-lisp/str
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:cl-megolm\/tests/,$d' ${PN}.asd
	rm -rf tests
}
