# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Python interface to CMU Sphinxbase and Pocketsphinx libraries"
HOMEPAGE="https://github.com/bambocher/pocketsphinx-python"
SRC_URI="https://github.com/bambocher/pocketsphinx-python/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
