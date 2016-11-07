# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Protocol Buffers in Common Lisp"
HOMEPAGE="https://github.com/ndantam/s-protobuf"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ndantam/s-protobuf.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"

src_prepare() {
	eapply_user
	rm Makefile
}
