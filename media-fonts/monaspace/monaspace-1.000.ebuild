# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="An innovative superfamily of fonts for code"
HOMEPAGE="https://monaspace.githubnext.com/"
SRC_URI="https://github.com/githubnext/monaspace/archive/refs/tags/v1.000.tar.gz -> ${P}.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

FONT_S="${S}"/fonts/otf
FONT_SUFFIX="otf"
