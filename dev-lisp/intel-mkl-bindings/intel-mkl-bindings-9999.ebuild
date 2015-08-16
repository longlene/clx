# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Bindings of extra routines other than BLAS/LAPACK"
HOMEPAGE="https://github.com/mathematical-systems/intel-mkl-bindings"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/mathematical-systems/intel-mkl-bindings.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sci-libs/mkl"
