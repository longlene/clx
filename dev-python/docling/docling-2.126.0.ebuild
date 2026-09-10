# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="SDK and CLI for parsing PDF, DOCX, HTML and more into a unified doc model"
HOMEPAGE="https://github.com/docling-project/docling"
SRC_URI="https://github.com/docling-project/docling/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cli convert-core format-office format-pdf format-web"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		<dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/docling-core-2.91.0[${PYTHON_USEDEP}]
		<dev-python/docling-core-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.3.0[${PYTHON_USEDEP}]
		<dev-python/pydantic-settings-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/filetype-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		>=dev-python/certifi-2024.7.4[${PYTHON_USEDEP}]
		>=dev-python/pluggy-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.65.0[${PYTHON_USEDEP}]
		convert-core? (
			>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
			>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
			>=dev-python/rtree-1.3.0[${PYTHON_USEDEP}]
			>=dev-python/scipy-1.6.0[${PYTHON_USEDEP}]
		)
		format-pdf? (
			>=dev-python/pypdfium2-4.30.0[${PYTHON_USEDEP}]
			>=dev-python/docling-parse-7.16.0[${PYTHON_USEDEP}]
			<dev-python/docling-parse-8[${PYTHON_USEDEP}]
		)
		format-office? (
			>=dev-python/python-docx-1.2.0[${PYTHON_USEDEP}]
			>=dev-python/python-pptx-1.0.2[${PYTHON_USEDEP}]
			>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		)
		format-web? (
			>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
			>=dev-python/marko-2.1.2[${PYTHON_USEDEP}]
		)
		cli? (
			>=dev-python/typer-0.12.5[${PYTHON_USEDEP}]
			>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
			dev-python/python-dotenv[${PYTHON_USEDEP}]
		)
	')
"
