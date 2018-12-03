# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9cda99284bcfa8e09c7e3219f3ed1f5cb227a064"

DESCRIPTION="Common Lisp EPMD client and server"
HOMEPAGE="https://github.com/flambard/cl-epmd"
SRC_URI="https://github.com/flambard/cl-epmd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/monkeylib-binary-data
	dev-lisp/usocket
"

src_prepare() {
	eapply_user
	use test || rm -rf test epmd-test.asd
}
