# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp implementation of the Erlang External Term Format"
HOMEPAGE="https://github.com/flambard/cl-erlang-term"
SRC_URI=""

EGIT_REPO_URI="https://github.com/flambard/cl-erlang-term.git"

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
"

src_prepare() {
	use test || rm -rf test erlang-term-test.asd
}
