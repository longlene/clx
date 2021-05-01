# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cfbc1f482970221e80d445080a188fd5c755cd2c"

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
