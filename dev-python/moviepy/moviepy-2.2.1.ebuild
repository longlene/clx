# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Video editing with Python"
HOMEPAGE="https://zulko.github.io/moviepy/ https://github.com/Zulko/moviepy"
SRC_URI="https://github.com/Zulko/moviepy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/decorator-4.0.2[${PYTHON_USEDEP}]
	>=dev-python/imageio-2.5[${PYTHON_USEDEP}]
	>=dev-python/imageio-ffmpeg-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.25.0[${PYTHON_USEDEP}]
	dev-python/proglog[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.10[${PYTHON_USEDEP}]
	>=dev-python/pillow-9.2.0[${PYTHON_USEDEP}]
')"
