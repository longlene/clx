# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="52102b856ebb4b21d833071ffbdcca17c7ef057c"

DESCRIPTION="A System for Making Generative Systems"
HOMEPAGE="https://github.com/inconvergent/weird"
SRC_URI="https://github.com/inconvergent/weird/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/cl-svg
	dev-lisp/lparallel
	dev-lisp/veq
	dev-lisp/split-sequence
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:weird\/tests/,$d' ${PN}.asd
	rm -rf test
}
