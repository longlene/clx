# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Speech recognition module for Python"
HOMEPAGE="https://github.com/Uberi/speech_recognition"
SRC_URI="https://github.com/Uberi/speech_recognition/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
