# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python client for Meilisearch"
HOMEPAGE="
	https://github.com/meilisearch/meilisearch-python
	https://pypi.org/project/meilisearch/
"
SRC_URI="https://github.com/meilisearch/meilisearch-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/meilisearch-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
# tests need a running Meilisearch server
RESTRICT="test"

RDEPEND="
	dev-python/camel-converter[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
