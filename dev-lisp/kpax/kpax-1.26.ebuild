# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1f0e4fc1f9921f4c02fd0e81ba8f646bd2f10e95"

DESCRIPTION="A Common Lisp Web Application Framework"
HOMEPAGE="https://github.com/svenvc/KPAX"
SRC_URI="https://github.com/svenvc/KPAX/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-who
	dev-lisp/puri
	dev-lisp/ironclad
	dev-lisp/s-utils
	dev-lisp/s-sysdeps
	dev-lisp/s-base64
	dev-lisp/s-http-server
"
BDEPEND=""

src_prepare() {
	default
	use example || rm -r ${PN}-examples.asd example
}
