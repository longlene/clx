# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Simple document store database layered over SQLite"
HOMEPAGE="https://github.com/orthecreedence/sqlite-obj"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/sqlite-obj.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/sqlite
dev-lisp/vom
dev-lisp/yason
"
