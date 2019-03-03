# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="38d3bde137ecc4b0eb6da25e31485408c7965611"

DESCRIPTION="Code Evaluate Play Loop"
HOMEPAGE="https://github.com/cbaggers/cepl"
SRC_URI="https://github.com/cbaggers/cepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/documentation-utils
	dev-lisp/ieee-floats
	dev-lisp/named-readtables
	dev-lisp/rtg-math
	dev-lisp/varjo
	dev-lisp/closer-mop
	dev-lisp/bordeaux-threads
"

src_prepare() {
	eapply_user
	rm -r docs
}
