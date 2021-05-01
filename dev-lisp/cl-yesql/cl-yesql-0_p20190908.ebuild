# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef3a7e52cf5dfaf48e20aebe05db40d8e7f0a8b1"

DESCRIPTION="Common Lisp library for using SQL"
HOMEPAGE="https://github.com/ruricolist/cl-yesql"
SRC_URI="https://github.com/ruricolist/cl-yesql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/postmodern
	dev-lisp/cl-ppcre
"
