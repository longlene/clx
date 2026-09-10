# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Selects diverse photos from Immich as training data for Frigate"
HOMEPAGE="https://github.com/sudolulo/winnow"
SRC_URI="https://github.com/sudolulo/winnow/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/croniter-5.0.2[${PYTHON_USEDEP}]
	>=dev-python/insightface-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.2.6[${PYTHON_USEDEP}]
	>=media-libs/opencv-4.12.0[python,${PYTHON_USEDEP}]
	>=dev-python/pillow-12.1.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/rich-14.2.0[${PYTHON_USEDEP}]
	>=sci-libs/onnxruntime-1.23.2[python,${PYTHON_USEDEP}]
"
