# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="719f19318c61351b6d3f95ffc555206ab4b34097"

DESCRIPTION="An experimental port of clojure to common lisp"
HOMEPAGE="https://github.com/joinr/clclojure"
SRC_URI="https://github.com/joinr/clclojure/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
