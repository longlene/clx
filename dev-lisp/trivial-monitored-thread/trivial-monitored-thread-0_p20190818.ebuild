# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="705aeeb8bcf3d460460b4767475fc3d8e8ea3d0e"


DESCRIPTION="A Common Lisp library offering a way of spawning threads and being informed when one any of them crash and die"
HOMEPAGE="https://gitlab.com/ediethelm/trivial-monitored-thread"
SRC_URI="https://gitlab.com/ediethelm/trivial-monitored-thread/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-utilities
	dev-lisp/log4cl
	dev-lisp/iterate
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem :trivial-monitored-thread\/test/,$d' ${PN}.asd
		rm test-${PN}.lisp
	fi
}
