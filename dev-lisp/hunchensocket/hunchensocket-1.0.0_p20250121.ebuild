# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="028a0a56996878a90037f3ef822a2437e8605483"

DESCRIPTION="WebSockets for Hunchentoot"
HOMEPAGE="https://github.com/joaotavora/hunchensocket"
SRC_URI="https://github.com/joaotavora/hunchensocket/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/ironclad
	dev-lisp/flexi-streams
	dev-lisp/chunga
	dev-lisp/trivial-utf8
	dev-lisp/trivial-backtrace
	dev-lisp/bordeaux-threads
	dev-lisp/cl-fad
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm ${PN}-tests.lisp
		sed -e '/defsystem\ :hunchensocket-tests/,$d' -i ${PN}.asd
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION
}
