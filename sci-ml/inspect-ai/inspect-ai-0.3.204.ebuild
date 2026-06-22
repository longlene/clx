# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A framework for large language model evaluations"
HOMEPAGE="
	https://pypi.org/project/inspect-ai/
	https://github.com/UKGovernmentBEIS/inspect_ai
"
SRC_URI="https://github.com/UKGovernmentBEIS/inspect_ai/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/inspect_ai-${PV}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/aioboto3-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.10.0[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.3[${PYTHON_USEDEP}]
	dev-python/debugpy[${PYTHON_USEDEP}]
	>=dev-python/docstring-parser-0.16[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.1.0[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	>=dev-python/ijson-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/jsonlines-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jsonpatch-1.32[${PYTHON_USEDEP}]
	>=dev-python/jsonpath-ng-1.8.0[${PYTHON_USEDEP}]
	>=dev-python/jsonref-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/mmh3-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/nest-asyncio2-1.7.2[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.3.0[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.11.4[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.16.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/rich-13.3.3[${PYTHON_USEDEP}]
	>=dev-python/s3fs-2023[${PYTHON_USEDEP}]
	>=dev-python/semver-3.0.0[${PYTHON_USEDEP}]
	dev-python/shortuuid[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	>=dev-python/textual-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/tiktoken-0.12.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.14.0[${PYTHON_USEDEP}]
	>=dev-python/universal-pathlib-0.2.6[${PYTHON_USEDEP}]
	>=dev-python/zipfile-zstd-0.0.4[${PYTHON_USEDEP}]
	>=dev-python/zipp-3.19.1[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.20.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_INSPECT_AI=${PV}
