# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7474c02caca559821fb801245d447f987b6f6f99"

DESCRIPTION="Lua-style Pattern Matching for Common Lisp"
HOMEPAGE="https://github.com/massung/re"
SRC_URI="https://github.com/massung/re/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parse
"
