# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2e0f648efe52cb3128c12dd060b576404c4060de"

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
