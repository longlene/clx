# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="85178a9204d40b53a41b0743f7bbf93027dd285f"

DESCRIPTION="CFFI Bindings for Common Lisp"
HOMEPAGE="https://github.com/BradWBeer/cl-pango"
SRC_URI="https://github.com/BradWBeer/cl-pango/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
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
