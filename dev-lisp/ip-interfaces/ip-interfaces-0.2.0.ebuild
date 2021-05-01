# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Query network interfaces on the local machine"
HOMEPAGE="https://common-lisp.net/project/ip-interfaces/"
SRC_URI="https://common-lisp.net/project/ip-interfaces/releases/${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
