# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b6f9129cdcb27a562d7797534e0d35771b1beeab"

DESCRIPTION="Simple Bloom filters in Common Lisp with efficient hashing"
HOMEPAGE="https://github.com/ruricolist/cl-bloom"
SRC_URI="https://github.com/ruricolist/cl-bloom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-murmurhash
	dev-lisp/static-vectors
"
