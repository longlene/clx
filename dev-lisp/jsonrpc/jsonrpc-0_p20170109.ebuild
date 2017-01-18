# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fukamachi/jsonrpc.git"
else
	inherit vcs-snapshot
	EGIT_COMMIT="2ae6e584b590d88acedfd8081dc86e1dc5fe81cd"
	SRC_URI="https://github.com/fukamachi/jsonrpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
fi


DESCRIPTION="JSON-RPC 2.0 server/client for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/jsonrpc"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/yason
	dev-lisp/usocket
	dev-lisp/fast-io
	dev-lisp/trivial-utf8
	dev-lisp/alexandria
	dev-lisp/uiop
"

