# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb3e38950f58b80e6890ed9cda2cf6c887726eeb"

DESCRIPTION="SDL2 backend for ulubis"
HOMEPAGE="https://github.com/malcolmstill/ulubis-sdl"
SRC_URI="https://github.com/malcolmstill/ulubis-sdl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cepl-sdl2
	dev-lisp/ulubis
"
