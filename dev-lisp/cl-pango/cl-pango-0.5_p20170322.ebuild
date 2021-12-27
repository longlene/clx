# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ee4904d19ce22d00eb2fe17a4fe42e5df8ac8701"

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
