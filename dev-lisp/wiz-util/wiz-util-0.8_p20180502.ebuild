# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d04d81d35403d4b3ce5d72d52b78e4df43a093de"

DESCRIPTION="Utility collections for my daily work"
HOMEPAGE="https://github.com/masatoi/wiz-util"
SRC_URI="https://github.com/masatoi/wiz-util/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/metatilities
	dev-lisp/moptilities
	dev-lisp/metabang-bind
	dev-lisp/iterate
	dev-lisp/cl-ppcre
"
