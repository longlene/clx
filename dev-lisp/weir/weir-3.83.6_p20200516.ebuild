# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c657f0dfef6cc5db9e504f07068eadacb715515f"

DESCRIPTION="A System for Making Generative Systems"
HOMEPAGE="https://github.com/inconvergent/weir"
SRC_URI="https://github.com/inconvergent/weir/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/zpng
	dev-lisp/cl-svg
	dev-lisp/png
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/lparallel
	dev-lisp/inferior-shell
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:weir\/tests/,$d' ${PN}.asd
		rm -r test
	fi
}
