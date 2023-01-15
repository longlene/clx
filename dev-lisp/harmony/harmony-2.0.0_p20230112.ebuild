# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0b57483cc0341936c201b620f82a8542c606991f"

DESCRIPTION="A Common Lisp sound system"
HOMEPAGE="https://shirakumo.github.io/harmony"
SRC_URI="https://github.com/Shirakumo/harmony/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-mixed
	dev-lisp/atomics
	dev-lisp/bordeaux-threads
	dev-lisp/stealth-mixin
"
