# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="37cfe1eeac645857ea7002f0aa6662da45b9dd6e"

DESCRIPTION="Libssh2 bindings"
HOMEPAGE="https://github.com/alxchk/cl-libssh2"
SRC_URI="https://github.com/fukamachi/cl-libssh2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
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
	default
	use test || rm -rf test ${PN}.test.asd
}
