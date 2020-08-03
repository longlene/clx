# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="STM-based concurrency for lazy"
HOMEPAGE="https://github.com/HiTECNOLOGYs/hive-task"
SRC_URI=""

EGIT_REPO_URI="https://github.com/HiTECNOLOGYs/hive-task.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/clmisc
	dev-lisp/stmx
	dev-lisp/closer-mop
"
