# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="49329b63b17ae4e62f4e76196586d15d01c09073"

DESCRIPTION="Industrial-strength command-line parsing library for Common Lisp"
HOMEPAGE="https://github.com/williamyaoh/colander"
SRC_URI="https://github.com/williamyaoh/colander/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/fiveam
"
