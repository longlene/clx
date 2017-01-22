# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="539c90e58e668b72a2849e8c0caebf65236866c6"

DESCRIPTION="CAD system, powered by Common Lisp"
HOMEPAGE=" http://cl-cad.blogspot.com"
SRC_URI="https://github.com/LiteTabs/CL-CAD/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-gtk2
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/iterate
	dev-lisp/cl-cairo2
"
