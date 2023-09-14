# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c59000c9c7f2fb44e95c2819b3e86d84205747c5"

DESCRIPTION="Unofficial bindings to Rigetti Forest in Common Lisp"
HOMEPAGE="https://github.com/tarballs-are-good/cl-forest"
SRC_URI="https://github.com/tarballs-are-good/cl-forest/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/yason
	dev-lisp/alexandria
	dev-lisp/ieee-floats
"
