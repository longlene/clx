# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ba902847370daf8a7a07297ca225f96ab079394b"

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
