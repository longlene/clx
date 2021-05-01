# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0e71752ea6b14e500ed8fb224283c85207b342d5"

DESCRIPTION="Common Lisp IRC framework and osu! bot"
HOMEPAGE="https://github.com/williamyaoh/gobbet"
SRC_URI="https://github.com/williamyaoh/gobbet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/usocket
	dev-lisp/cl-ppcre
	dev-lisp/bordeaux-threads
	dev-lisp/defrecord
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/named-readtables
"
