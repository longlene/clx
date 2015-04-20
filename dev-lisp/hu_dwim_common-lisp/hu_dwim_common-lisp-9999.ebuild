# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A redefinition of the standard Common Lisp package that includes a number of renames and shadows"
HOMEPAGE="http://dwim.hu/project/hu.dwim.common-lisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nixeagle/hu.dwim.common-lisp.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
