# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="12bc9a37cd273c48f670c68e91bf4d4db3441ecb"

DESCRIPTION="Common Lisp Erlang Interface"
HOMEPAGE="http://common-lisp.net/project/cleric"
SRC_URI="https://github.com/flambard/CLERIC/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/epmd
	dev-lisp/erlang-term
	dev-lisp/usocket
	dev-lisp/md5
	dev-lisp/alexandria
	dev-lisp/monkeylib-binary-data
"

src_prepare() {
	default
	use test || rm -rf test cleric-test.asd
}
