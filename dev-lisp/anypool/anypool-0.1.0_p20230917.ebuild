# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e0e387bce6b57e9d36b4e0382f109d5d292362e"

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
