# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="7b687776f98d5344660a1c31fd4c2fb5f7896736"

DESCRIPTION="The Lobster Programming Language"
HOMEPAGE="https://github.com/aardappel/lobster"
SRC_URI="https://github.com/aardappel/lobster/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/opengl
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/dev
