# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b3a159382117eba8397a7dfdf53beeff97e5ef37"

DESCRIPTION="markup provides a reader-macro to read HTML/XML tags inside of Common Lisp code"
HOMEPAGE="https://github.com/moderninterpreters/markup"
SRC_URI="https://github.com/moderninterpreters/markup/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/str
	dev-lisp/alexandria
	dev-lisp/named-readtables
"
