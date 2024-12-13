# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Python binding for libvips using cffi"
HOMEPAGE="https://github.com/libvips/pyvips"
SRC_URI="https://github.com/libvips/pyvips/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/cffi[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
