# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b0e85a465aec2dc899f69bbf6b4e3bff3cd90103"

DESCRIPTION="An SSH client library for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/trivial-ssh"
SRC_URI="https://github.com/eudoxia0/trivial-ssh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/usocket
	dev-lisp/cl-fad
	dev-lisp/trivial-graystreams
	dev-lisp/babel
	dev-lisp/split-sequence
"

src_prepare() {
	use test || rm -f ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
