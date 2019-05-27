# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fcdc71315f811f181de38010e5f494edc9398b5d"

DESCRIPTION="An actor system for Common Lisp"
HOMEPAGE="https://github.com/naveensundarg/Common-Lisp-Actors"
SRC_URI="https://github.com/naveensundarg/Common-Lisp-Actors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
