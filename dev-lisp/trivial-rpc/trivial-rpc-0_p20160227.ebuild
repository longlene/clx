# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c202954be2c7dc162a65c90c0c88310103ed1518"

DESCRIPTION="A Extendable asynchronous RPC framework for Common Lisp"
HOMEPAGE="https://github.com/mmontone/trivial-rpc"
SRC_URI="https://github.com/mmontone/trivial-rpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
