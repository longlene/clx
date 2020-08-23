# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8e4da084107c2a6a3778856fe554dc37e9bc46bb"

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
"

src_prepare() {
	eapply_user
	use test || rm -rf test erlang-term-test.asd
}
