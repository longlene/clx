# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f00616ee0de4b52c2aa3441b0a73be3d078b0ff9"

DESCRIPTION="A feed aggregator written in Common Lisp"
HOMEPAGE="https://github.com/SamSkulls/rss-bastard"
SRC_URI="https://github.com/SamSkulls/rss-bastard/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/drakma
	dev-lisp/cxml
	dev-lisp/plexippus-xpath
	dev-lisp/cl-store
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/conspath
"
