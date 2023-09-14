# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="00377207f6cd4688e31316633ced4a59cb982aa1"

DESCRIPTION="Manage all your bookmarks from the web"
HOMEPAGE="https://github.com/OlafMerkert/bookmark-server"
SRC_URI="https://github.com/OlafMerkert/bookmark-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ol-utils
	dev-lisp/web-utils
	dev-lisp/hunchentoot
	dev-lisp/cl-who
	dev-lisp/clsql
	dev-lisp/split-sequence
	dev-lisp/css-lite
	dev-lisp/parenscript
	dev-lisp/cl-json
	dev-lisp/cl-containers
"
BDEPEND=""
