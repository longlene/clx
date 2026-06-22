# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="All-in-One RAG Framework"
HOMEPAGE="https://github.com/HKUDS/RAG-Anything"
SRC_URI="https://github.com/HKUDS/RAG-Anything/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/RAG-Anything-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="image markdown text"
RESTRICT="test"

RDEPEND="
	sci-ml/huggingface_hub
	$(python_gen_any_dep '
		sci-ml/lightrag[${PYTHON_USEDEP}]
		sci-ml/mineru[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		image? ( >=dev-python/pillow-10.0.0[${PYTHON_USEDEP}] )
		text? ( >=dev-python/reportlab-4.0.0[${PYTHON_USEDEP}] )
		markdown? (
			>=dev-python/markdown-3.4.0[${PYTHON_USEDEP}]
			>=dev-python/weasyprint-60.0[${PYTHON_USEDEP}]
			>=dev-python/pygments-2.10.0[${PYTHON_USEDEP}]
		)
	')"
