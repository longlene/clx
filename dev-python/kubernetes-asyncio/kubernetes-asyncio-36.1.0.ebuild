# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Kubernetes Asynchronous Python Client"
HOMEPAGE="https://github.com/tomplus/kubernetes_asyncio https://pypi.org/project/kubernetes-asyncio/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

python_prepare_all() {
	# Upstream wheel include list contains non-package files that land in site-packages root
	sed -i \
		-e '/"pyproject\.toml"/d' \
		-e '/"LICENSE"/d' \
		-e '/"CHANGELOG\.md"/d' \
		-e '/"CONTRIBUTING\.md"/d' \
		-e '/"README\.md"/d' \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}

RDEPEND="$(python_gen_cond_dep '
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
')"
