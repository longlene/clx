# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="36b5642af5592afd4abb8a51efc828e8727cb90a"

DESCRIPTION="A framework to support the implementation of REST style client/server functionality in Common Lisp"
HOMEPAGE="https://github.com/svenvc/s-rest"
SRC_URI="https://github.com/svenvc/s-rest/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/s-http-client
	dev-lisp/s-http-server
	dev-lisp/cl-who
"
