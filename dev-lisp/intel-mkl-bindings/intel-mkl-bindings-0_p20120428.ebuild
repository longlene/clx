# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5fe9e885ba43f7f352435c980568ef11b8c516eb"

DESCRIPTION="Bindings of extra routines other than BLAS/LAPACK"
HOMEPAGE="https://github.com/mathematical-systems/intel-mkl-bindings"
SRC_URI="https://github.com/mathematical-systems/intel-mkl-bindings/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/mkl
"
