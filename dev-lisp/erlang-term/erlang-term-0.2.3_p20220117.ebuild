# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e2dd56f7ece57d16ff13e7b142490a0ea9a0b21e"

DESCRIPTION="Common Lisp implementation of the Erlang External Term Format"
HOMEPAGE="https://github.com/flambard/cl-erlang-term"
SRC_URI="https://github.com/flambard/cl-erlang-term/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/ieee-floats
	dev-lisp/nibbles
	dev-lisp/zlib
	dev-lisp/trivia
"

src_prepare() {
	default
	use test || rm -rf test erlang-term-test.asd
}
