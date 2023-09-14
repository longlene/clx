# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ffb8734a0dee24940e1adabeddb0371a6d424aec"

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
