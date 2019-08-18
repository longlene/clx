# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="870b5390d566e27c64c342e0afc27ec4ff439a5e"

DESCRIPTION="Common Lisp interface to WrodNet"
HOMEPAGE="https://github.com/phoe/wordnet/"
SRC_URI="https://github.com/phoe/wordnet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
"
BDEPEND=""
