# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="MAT is library for working with multi-dimensional arrays which supports efficient interfacing to foreign and CUDA code"
HOMEPAGE="https://github.com/melisgl/mgl-mat"
SRC_URI=""

EGIT_REPO_URI="https://github.com/melisgl/mgl-mat.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/bordeaux-threads
dev-lisp/cffi
dev-lisp/cl-cuda
dev-lisp/flexi-streams
dev-lisp/ieee-floats
dev-lisp/lla
dev-lisp/mgl-pax
dev-lisp/static-vectors
dev-lisp/trivial-garbage
"
