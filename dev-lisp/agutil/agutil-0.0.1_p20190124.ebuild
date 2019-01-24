# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0464a88a7d7450d31c842ad6302a75632866c50b"

DESCRIPTION="A collection of Common Lisp utilities"
HOMEPAGE="https://github.com/alex-gutev/agutil"
SRC_URI="https://github.com/alex-gutev/agutil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivia
"
BDEPEND=""
