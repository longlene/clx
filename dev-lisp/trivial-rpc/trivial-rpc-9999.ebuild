# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A Extendable asynchronous RPC framework for Common Lisp"
HOMEPAGE="https://github.com/mmontone/trivial-rpc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmontone/trivial-rpc.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/pzqm
	dev-lisp/cl-store
"
