# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="49035569941476e88bef6871e7545a1af40ac942"

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
