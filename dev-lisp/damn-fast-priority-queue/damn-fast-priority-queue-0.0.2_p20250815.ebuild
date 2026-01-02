# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGTI_COMMIT="f4c03741d05c757aed245b41a5c3f8c7096cc1d2"

DESCRIPTION="A heap-based priority queue whose first and foremost priority is speed"
HOMEPAGE="https://github.com/phoe/damn-fast-priority-queue"
SRC_URI="https://github.com/phoe/damn-fast-priority-queue/archive/${EGTI_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGTI_COMMIT}

src_prepare() {
	default
	rm -rf priority-queue-benchmark
	sed -e '/defsystem #:damn-fast-priority-queue\/test/,$' \
		-i damn-fast-priority-queue/damn-fast-priority-queue.asd
	rm damn-fast-priority-queue/test.lisp
	sed -e '/defsystem #:damn-fast-stable-priority-queue\/test/,$' \
		-i damn-fast-stable-priority-queue/damn-fast-stable-priority-queue.asd
	rm damn-fast-stable-priority-queue/test.lisp
}
