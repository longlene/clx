# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="ZLIB library"
HOMEPAGE="https://github.com/sharplispers/zlib"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sharplispers/zlib.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
