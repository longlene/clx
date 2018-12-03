# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ae08e403a2905124607a2107065cb6800e8402c2"

DESCRIPTION="Common Lisp DNS client"
HOMEPAGE="https://github.com/fjames86/dragons"
SRC_URI="https://github.com/fjames86/dragons/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fsocket
	dev-lisp/drx
	dev-lisp/nibbles
	dev-lisp/babel
	dev-lisp/pounds
"
