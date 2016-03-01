# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="CLOS extension for context-oriented Programming"
HOMEPAGE="http://common-lisp.net/project/closer/"
SRC_URI="https://github.com/pcostanza/contextl/archive/v1.0.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="
	dev-lisp/lw-compat
	>=dev-lisp/closer-mop-1.0.0
"
