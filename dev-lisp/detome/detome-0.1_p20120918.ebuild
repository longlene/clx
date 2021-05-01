# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="108ed05427a34a7d42de8ecac384aca63a8ab9e0"

DESCRIPTION="Detome game"
HOMEPAGE="https://github.com/nowl/detome"
SRC_URI="https://github.com/nowl/detome/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lispbuilder-sdl
	dev-lisp/lispbuilder-sdl-image
"
