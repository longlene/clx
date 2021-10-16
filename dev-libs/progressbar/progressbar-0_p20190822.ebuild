# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

EGIT_COMMIT="01c2f7f0493df0cb08f04b9aef150b5988e6b63c"

DESCRIPTION="An easy-to-use C library for displaying text progress bars"
HOMEPAGE="https://github.com/doches/progressbar"
SRC_URI="https://github.com/doches/progressbar/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

