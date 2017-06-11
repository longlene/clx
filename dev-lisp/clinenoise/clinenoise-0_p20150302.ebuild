# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4a84f67b7a026d6a67681af576a5333bbaec4ca2"

DESCRIPTION="Straight port of linenoise to Common Lisp"
HOMEPAGE="https://github.com/jasom/clinenoise"
SRC_URI="https://github.com/jasom/clinenoise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/split-sequence
"
