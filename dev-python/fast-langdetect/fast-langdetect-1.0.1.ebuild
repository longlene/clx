# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="80x faster fasttext language detection and text splitting by language"
HOMEPAGE="https://github.com/LlmKira/fast-langdetect"
SRC_URI="https://github.com/LlmKira/fast-langdetect/archive/refs/tags/pypi_${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/fast-langdetect-pypi_${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/fasttext-predict-0.9.2.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/robust-downloader-0.0.2[${PYTHON_USEDEP}]
')"
