# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A new kind of Progress Bar, with real-time throughput, ETA, and very cool animations"
HOMEPAGE="
    https://github.com/rsalmei/alive-progress
	https://pypi.org/project/alive-progress/
"
SRC_URI="https://github.com/rsalmei/alive-progress/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/about-time-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/grapheme-0.6.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

src_prepare() {
	default
	sed -e '/data_files=/d' \
		-i setup.py
	distutils-r1_src_prepare
}
