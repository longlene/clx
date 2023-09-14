# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5dd6d5c0fa72927a5e7c2d60840dcf29e079b15"

DESCRIPTION="A collection of convenience functions and macros for Common Lisp"
HOMEPAGE="https://github.com/jmbr/incf-cl"
SRC_URI="https://github.com/jmbr/incf-cl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="X11"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:incf-cl\/tests/,$d' ${PN}.asd
		rm test-suite.lisp
	fi
}
