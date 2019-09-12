# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0efc6c6ae83f466c448614dd7d2487bc2696297e"

DESCRIPTION="A Common Lisp implementation of TLS1.3"
HOMEPAGE="https://github.com/mateuszb/tls1.3"
SRC_URI="https://github.com/mateuszb/tls1.3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ironclad
	dev-lisp/alien-ring
	dev-lisp/socket
	dev-lisp/reactor
	dev-lisp/cl-speedy-queue
	dev-lisp/flexi-streams
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use ; then
		sed -i '/defsystem "tls-1.3/,$d' tls-1.3.asd
		rm -r tests
	fi
}
