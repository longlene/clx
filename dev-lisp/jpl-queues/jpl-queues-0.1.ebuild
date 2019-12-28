# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A few different kinds of queues, with optional multithreading synchronization"
HOMEPAGE="https://www.thoughtcrime.us/software/jpl-queues/"
SRC_URI="https://www.thoughtcrime.us/software/jpl-queues/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-jpl-util
	dev-lisp/bordeaux-threads
"
BDEPEND=""
