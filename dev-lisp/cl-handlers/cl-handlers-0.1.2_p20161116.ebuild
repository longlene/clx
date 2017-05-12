# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ab8aa99f59838d1c86884062b6001a54c21711d4"

DESCRIPTION="An HTTP-handler declaration mini-language aiming for cross-server compatibility"
HOMEPAGE="https://github.com/Inaimathi/cl-handlers"
SRC_URI="https://github.com/Inaimathi/cl-handlers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Expat"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"
