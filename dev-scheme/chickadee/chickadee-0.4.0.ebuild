# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A game development toolkit for Guile Scheme"
HOMEPAGE="https://dthompson.us/projects/chickadee.html"
SRC_URI="https://files.dthompson.us/chickadee/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-scheme/guile-sdl2
	dev-scheme/guile-opengl
"
RDEPEND="${DEPEND}"
