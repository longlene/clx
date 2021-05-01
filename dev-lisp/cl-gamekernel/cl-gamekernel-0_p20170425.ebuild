# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="26490238ba7fea9904b3e7e37d84398e807d9db3"

DESCRIPTION="Common Lisp wrapper for GameKernel"
HOMEPAGE="https://github.com/rpav/cl-gamekernel"
SRC_URI="https://github.com/rpav/cl-gamekernel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/defpackage-plus
	dev-lisp/trivial-garbage
	dev-lisp/cl-autowrap
	dev-libs/gamekernel
"
