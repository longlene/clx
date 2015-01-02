# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Efficient way to use \"subseq\"s in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/xsubseq/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/xsubseq.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
