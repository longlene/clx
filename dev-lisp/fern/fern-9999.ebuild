# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="A concurrency framework for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/fern"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/fern.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-async-future
	dev-lisp/cl-async
	dev-lisp/bordeaux-threads
	dev-lisp/jpl-queues
	dev-lisp/optima
	dev-lisp/yason
	dev-lisp/log4cl
"
