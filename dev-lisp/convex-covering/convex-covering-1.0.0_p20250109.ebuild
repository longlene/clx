# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="14af265defc24161004523488713d0e34e0abba0"

DESCRIPTION="An algorithm for the computation of a convex hull covering set of a mesh"
HOMEPAGE="https://github.com/Shirakumo/convex-covering"
SRC_URI="https://github.com/Shirakumo/convex-covering/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/manifolds
	dev-lisp/3d-spaces
	dev-lisp/quickhull
	dev-lisp/damn-fast-priority-queue
	dev-lisp/machine-state
	dev-lisp/documentation-utils
"
BDEPEND=""
