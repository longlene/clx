# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2836f83dc9aaf874b1011aa1319c95d2e6b19377"

DESCRIPTION="Common Lisp client for Elasticsearch"
HOMEPAGE="https://github.com/kraison/cl-elasticsearch"
SRC_URI="https://github.com/kraison/cl-elasticsearch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/clouchdb
	dev-lisp/cl-json
	dev-lisp/iterate
	dev-lisp/drakma
	dev-lisp/log4cl
	dev-lisp/bordeaux-threads
"
