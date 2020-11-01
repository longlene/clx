# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="91dd3a891e639f41d44bfb5f449daf0fcd408e29"

DESCRIPTION="ZeroMQ Common Lisp bindings"
HOMEPAGE="https://github.com/orivej/pzmq"
SRC_URI="https://github.com/orivej/pzmq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	net-libs/zeromq
"
