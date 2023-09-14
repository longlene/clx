# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="POSIX shared memory for Common Lisp"
HOMEPAGE="https://git.sr.ht/~shunter/posix-shm"
SRC_URI="https://git.sr.ht/~shunter/posix-shm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:posix-shm\/test/,$d' \
		-i ${PN}.asd
	rm test.lisp
}
