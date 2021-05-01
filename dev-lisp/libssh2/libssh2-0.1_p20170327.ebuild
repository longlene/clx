# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b590ec28c862c4ed9c057f9d52ec28ac010a23da"

DESCRIPTION="Libssh2 bindings"
HOMEPAGE="https://github.com/alxchk/cl-libssh2"
SRC_URI="https://github.com/fare/cl-libssh2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	net-libs/libssh2
	dev-lisp/babel
	dev-lisp/cffi
	dev-lisp/cl-fad
	dev-lisp/hu_dwim_logger
	dev-lisp/split-sequence
	dev-lisp/trivial-gray-streams
	dev-lisp/usocket
"

src_prepare() {
	eapply_user
	use test || rm -rf test ${PN}.test.asd
}
