# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="aa0b7dcd6abdd127b11a540c848dd230ebcc5d8b"

DESCRIPTION="A low-level tool to generate an AppImage from an existing AppDir"
HOMEPAGE="https://github.com/AppImage/appimagetool"
SRC_URI="https://github.com/AppImage/appimagetool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
