# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A kafka client in common lisp"
HOMEPAGE="https://github.com/yehohanan7/cl-kafka"
SRC_URI=""

EGIT_REPO_URI="https://github.com/yehohanan7/cl-kafka.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/uuid
	dev-lisp/usocket
	dev-lisp/cl-json
	dev-lisp/ironclad
	dev-lisp/bordeaux-threads
	dev-lisp/prove
"

