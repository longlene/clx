# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Practically Lenient and Unimpressive Markup Parser for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/plump"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/plump.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/trivial-indent
dev-lisp/array-utils
"
