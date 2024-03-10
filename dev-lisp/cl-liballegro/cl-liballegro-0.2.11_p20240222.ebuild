# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46dc64d9ad698fc1c0204da27b0bf0c61b3b8e3b"

DESCRIPTION="Allegro 5 game programming library bindings for Common Lisp"
HOMEPAGE="https://github.com/resttime/cl-liballegro"
SRC_URI="https://github.com/resttime/cl-liballegro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Allegro"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	media-libs/allegro
"
