# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="a programming typeface"
HOMEPAGE="https://github.com/madmalik/mononoki/"
SRC_URI="https://github.com/madmalik/mononoki/releases/download/${PV}/mononoki.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

FONT_SUFFIX="ttf"
