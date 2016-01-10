# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="MPI bindings for Common Lisp with many useful extras"
HOMEPAGE="https://github.com/marcoheisig/cl-mpi"
SRC_URI=""

EGIT_REPO_URI="https://github.com/marcoheisig/cl-mpi.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND="virtual/mpi"
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/static-vectors
"

src_prepare() {
	use test || rm -rf testsuite cl-mpi-testsuite.asd
}
