# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="356a5f222aeaa792ae04f7503b1d0fe39d37bb8e"

DESCRIPTION="MPI bindings for Common Lisp with many useful extras"
HOMEPAGE="https://github.com/marcoheisig/cl-mpi"
SRC_URI="https://github.com/marcoheisig/cl-mpi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/static-vectors
"

src_prepare() {
	eapply_user
	use test || rm -rf testsuite cl-mpi-testsuite.asd
}
