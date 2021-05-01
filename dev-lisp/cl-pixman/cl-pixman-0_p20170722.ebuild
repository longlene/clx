# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bc848f3435fbf78ac183a337eba3e2442963ee51"

DESCRIPTION="Common Lisp bindings for Pixman using CFFI"
HOMEPAGE="https://github.com/ReinUsesLisp/cl-pixman/"
SRC_URI="https://github.com/ReinUsesLisp/cl-pixman/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	x11-libs/pixman
"
