# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Encode/decode any-base integers and byte arrays interchangeably"
HOMEPAGE="https://github.com/EuAndreh/cl-intbytes"
SRC_URI=""

EGIT_REPO_URI="https://github.com/EuAndreh/cl-intbytes.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fast-io
"

src_install() {
	common-lisp-install-sources -t all *.asd src t README.md
}
