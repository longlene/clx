# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The AT Protocol SDK"
HOMEPAGE="https://github.com/MarshalX/atproto"
SRC_URI="https://github.com/MarshalX/atproto/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-15[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7[${PYTHON_USEDEP}]
	>=dev-python/libipld-3.0.1[${PYTHON_USEDEP}]
	>=dev-python/dnspython-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.7[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.24.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/poetry-core-2.0.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-asyncio-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/coverage-7.3[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest

python_prepare_all() {
	# poetry-dynamic-versioning requires a git repo and has an incompatible
	# dunamai API (highest_tag) on our installed dev-python/dunamai; switch to
	# the static poetry-core backend and embed the version (nicegui pattern).
	sed -i \
		-e 's|build-backend = "poetry_dynamic_versioning.backend"|build-backend = "poetry.core.masonry.api"|' \
		-e 's|requires = \["poetry-core>=2.0.0", "poetry-dynamic-versioning>=1.0.0,<2.0.0"\]|requires = ["poetry-core>=2.0.0"]|' \
		-e "s|^dynamic = \[\"version\"\]|version = \"${PV}\"|" \
		-e "s|^version = \"0.0.0\" .*|version = \"${PV}\"|" \
		pyproject.toml || die
	distutils-r1_python_prepare_all
}
