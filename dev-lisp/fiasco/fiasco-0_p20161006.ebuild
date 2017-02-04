# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7c1984167e8bf47ed1a5b5a7bd14b6406c0c6fca"

DESCRIPTION="A test framework for Common Lisp"
HOMEPAGE="https://github.com/capitaomorte/fiasco"
SRC_URI="https://github.com/capitaomorte/fiasco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
