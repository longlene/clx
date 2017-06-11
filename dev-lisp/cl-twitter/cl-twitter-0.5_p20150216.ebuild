# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f8c8c3d49486c9be0547a86787050bea6fd17980"

DESCRIPTION="Common Lisp Client for Twitter"
HOMEPAGE="https://github.com/fons/cl-twitter"
SRC_URI="https://github.com/fons/cl-twitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/trivial-http
	dev-lisp/drakma
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/cl-oauth
	dev-lisp/url-rewrite
	dev-lisp/elephant
	dev-lisp/cl-mongo
"
