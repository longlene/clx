# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="40f405bbff71cb05f88d1ec1fc0a8d24055e1627"

DESCRIPTION="Python C extension for the eSpeak speech synthesizer"
HOMEPAGE="https://github.com/asrp/python-espeak"
SRC_URI="https://github.com/asrp/python-espeak/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="app-accessibility/espeak"
RDEPEND="${DEPEND}"
