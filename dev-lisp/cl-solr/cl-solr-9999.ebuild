# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Apache Solr API for Common Lisp"
HOMEPAGE="https://github.com/lokedhs/cl-solr"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lokedhs/cl-solr.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/alexandria
	dev-lisp/cxml
	dev-lisp/xpath
	dev-lisp/string-case
"
