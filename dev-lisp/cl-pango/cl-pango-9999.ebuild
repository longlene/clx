# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="CFFI Bindings for Common Lisp"
HOMEPAGE="https://github.com/BradWBeer/cl-pango"
SRC_URI=""

EGIT_REPO_URI="https://github.com/BradWBeer/cl-pango.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-cairo2
	dev-lisp/xmls
	x11-libs/pango
"
