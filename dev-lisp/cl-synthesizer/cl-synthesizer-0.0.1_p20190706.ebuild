# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2b356db26d927264a8fae0ce024acdf6a7093589"

DESCRIPTION="A modular audio synthesizer implemented in Common Lisp"
HOMEPAGE="https://github.com/Frechmatz/cl-synthesizer"
SRC_URI="https://github.com/Frechmatz/cl-synthesizer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-wave-file-writer
	test? ( dev-lisp/lisp-unit )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test ${PN}-examples.asd
}
