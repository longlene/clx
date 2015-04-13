# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Fast octet-vector/stream I/O for Common Lisp"
HOMEPAGE="https://github.com/rpav/fast-io"
SRC_URI=""

EGIT_REPO_URI="https://github.com/rpav/fast-io.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/trivial-gray-streams
dev-lisp/static-vectors
test? ( dev-lisp/fiveam dev-lisp/checkl )"

src_prepare() {
	if ! use test; then
		rm -rf fast-io-test.asd t
	fi
}
