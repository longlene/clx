# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font vcs-snapshot

EGIT_COMMIT="e1ea577660f54721e00b86cb988232b3d7a17a62"

DESCRIPTION="The Lisp Machine console font"
HOMEPAGE="https://github.com/unjordy/LispM-Font"
SRC_URI="https://github.com/unjordy/LispM-Font/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"
