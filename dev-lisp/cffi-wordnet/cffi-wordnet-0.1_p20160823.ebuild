# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f41873d40d81a68b13d7bea5736c05146c5f08b9"

DESCRIPTION="Common Lisp interface to WordNet 3.0 using CFFI"
HOMEPAGE="https://github.com/kraison/cffi-wordnet"
SRC_URI="https://github.com/kraison/cffi-wordnet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-dicts/wordnet
	dev-lisp/cffi
	dev-lisp/cl-ppcre
	dev-lisp/graph-utils
	dev-lisp/alexandria
"
