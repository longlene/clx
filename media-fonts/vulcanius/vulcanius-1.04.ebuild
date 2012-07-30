# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Unicode 4.0 compliant font covering the Gothic script"
HOMEPAGE="http://www.keidan.it/typo/fonts/vulc/"
SRC_URI="http://www.keidan.it/assets/Vulcanius.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
