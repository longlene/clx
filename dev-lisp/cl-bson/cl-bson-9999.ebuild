# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="BSON encoder/decoder for Common Lisp"
HOMEPAGE="http://euandre.org/cl-BSON"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/EuAndreh/cl-BSON.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources -t all src t *.asd README.md
}
