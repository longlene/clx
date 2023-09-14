# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9972ca1be6ee872881431238b6a5bae5ba934356"

DESCRIPTION="DNS server written in Common Lisp"
HOMEPAGE="https://github.com/hanshuebner/ans"
SRC_URI="https://github.com/hanshuebner/ans/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/cl-ppcre
"
