# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Send frames to a virtual camera from Python"
HOMEPAGE="
	https://github.com/letmaik/pyvirtualcam
	https://pypi.org/project/pyvirtualcam/
"
SRC_URI="https://github.com/letmaik/pyvirtualcam/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/libyuv
	>=dev-python/pybind11-2.6.0[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
