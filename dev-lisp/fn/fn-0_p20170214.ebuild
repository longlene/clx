# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="80aedf95d4f74ca9462b3bf1e39416ee6a017f3c"

DESCRIPTION="A couple of lambda shorthand macros"
HOMEPAGE="https://github.com/cbaggers/fn"
SRC_URI="https://github.com/cbaggers/fn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/macroexpand-dammit
	dev-lisp/named-readtables
"
