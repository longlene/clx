# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="14401e17e637e1a6c4760dc816928b29823efa59"

DESCRIPTION="A trivial line-input library for VT-like terminals"
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
