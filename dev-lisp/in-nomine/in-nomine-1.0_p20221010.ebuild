# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c287ee1f94835249f3e0e51911be702d1df5716e"

DESCRIPTION="Utilities for extensible namespaces in Common Lisp"
HOMEPAGE="https://github.com/phoe/in-nomine"
SRC_URI="https://github.com/phoe/in-nomine/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:in-nomine\/test/,$d' \
		-i ${PN}.asd
	rm -rf t
}
