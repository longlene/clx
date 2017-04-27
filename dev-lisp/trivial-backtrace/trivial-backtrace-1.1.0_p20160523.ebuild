# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ca81c011b86424a381a7563cea3b924f24e6fbeb"

DESCRIPTION="A simple library for generating a backtrace portably."
HOMEPAGE="http://common-lisp.net/project/trivial-backtrace"
SRC_URI="https://github.com/gwkkwg/trivial-backtrace/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING
}
