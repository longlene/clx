# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5389ec945882e87f2fc1d3e852c91aaf176556e5"

DESCRIPTION="General-purpose connection pooling library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/anypool"
SRC_URI="https://github.com/fukamachi/anypool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cl-speedy-queue
"
BDEPEND=""
