# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="bcabddd4c864d58b272a1d69b321ca9184ba45ac"

DESCRIPTION="Easily measure timing and throughput of code blocks, with beautiful human friendly representations"
HOMEPAGE="
	https://github.com/rsalmei/about-time
	https://pypi.org/project/about-time/
"
SRC_URI="https://github.com/rsalmei/about-time/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/about-time-${EGIT_COMMIT}

src_prepare() {
	default
	sed -e '/data_files/d' \
		-i setup.py
	distutils-r1_src_prepare
}
