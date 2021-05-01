# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="749f12c72bc3fb5d257228a17e360d365f3f081b"

DESCRIPTION="A Common Lisp library for parsing and testing time periods"
HOMEPAGE="https://github.com/wmannis/cl-period"
SRC_URI="https://github.com/wmannis/cl-period/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-yacc
"
