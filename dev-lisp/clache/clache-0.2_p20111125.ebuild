# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e70a06f2b14f0075828a8f0cce19e273aac7992"

DESCRIPTION="General Caching Facility for Common Lisp"
HOMEPAGE="https://github.com/m2ym/clache"
SRC_URI="https://github.com/m2ym/clache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-garbage
	dev-lisp/babel
	dev-lisp/ironclad
	dev-lisp/cl-fad
	dev-lisp/cl-store
	dev-lisp/cl-annot
	dev-lisp/cl-syntax
"
