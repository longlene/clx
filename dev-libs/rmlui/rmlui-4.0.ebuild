# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

DESCRIPTION="The HTML/CSS User Interface library evolved"
HOMEPAGE="https://github.com/mikke89/RmlUi"
SRC_URI="https://github.com/mikke89/RmlUi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	media-libs/freetype
"
RDEPEND="${DEPEND}"
BDEPEND=""
