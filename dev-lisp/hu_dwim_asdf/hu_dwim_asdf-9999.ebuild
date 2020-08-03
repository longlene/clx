# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Various ASDF extensions"
HOMEPAGE="http://dwim.hu/project/hu.dwim.asdf"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nixeagle/hu.dwim.asdf.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/hu_dwim_wui
"
