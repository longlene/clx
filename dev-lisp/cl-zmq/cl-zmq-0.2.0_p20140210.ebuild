# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="454a58ad84277599ac6da373b9c34a59a416d457"

DESCRIPTION="Common Lisp bindings for ZeroMQ"
HOMEPAGE="http://repo.or.cz/w/cl-zmq.git"
SRC_URI="http://repo.or.cz/cl-zmq.git/snapshot/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	net-libs/zeromq
"
