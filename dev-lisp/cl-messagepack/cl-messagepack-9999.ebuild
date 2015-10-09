# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp implementation of Message Pack"
HOMEPAGE="https://github.com/mbrezu/cl-messagepack"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/mbrezu/cl-messagepack.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/cl-json
	dev-lisp/fiveam
	dev-lisp/closer-mop
	dev-lisp/access
"
