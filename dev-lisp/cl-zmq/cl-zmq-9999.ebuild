# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings for ZeroMQ"
HOMEPAGE="http://repo.or.cz/w/cl-zmq.git"
SRC_URI=""

EGIT_REPO_URI="http://repo.or.cz/cl-zmq.git"

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
