# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8dd8976e8112974154803b3b60f6f27131f7478"

DESCRIPTION="Code Evaluate Play Loop"
HOMEPAGE="https://github.com/cbaggers/cepl"
SRC_URI="https://github.com/cbaggers/cepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-autowrap
	dev-lisp/cl-fad
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/documentation-utils
	dev-lisp/fn
	dev-lisp/ieee-floats
	dev-lisp/named-readtables
	dev-lisp/rtg-math
	dev-lisp/varjo
"

src_prepare() {
	eapply_user
	rm -r docs
}
