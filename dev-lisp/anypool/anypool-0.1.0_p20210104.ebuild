# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="af654821c9ffb034109459a242989c79a7f6f394"

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
