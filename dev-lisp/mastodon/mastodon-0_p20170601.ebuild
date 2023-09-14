# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3eac2a234794e6abea8036350fca851a43c00e1e"

DESCRIPTION="Common Lisp interface to mastodon"
HOMEPAGE="https://github.com/lokedhs/mastodon"
SRC_URI="https://github.com/lokedhs/mastodon/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/cxml
	dev-lisp/mcclim
	dev-lisp/closure-html
	dev-lisp/closer-mop
	dev-lisp/string-case
	dev-lisp/bordeaux-threads
	dev-lisp/yason
	dev-lisp/cl-ppcre
	dev-lisp/uiop
	dev-lisp/lparallel
	dev-lisp/local-time
	dev-lisp/status-net
"
