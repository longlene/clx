# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Guidance platform for deploying and managing large language models"
HOMEPAGE="https://github.com/vllm-project/guidellm"
SRC_URI="https://github.com/vllm-project/guidellm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="tokenizers vision"
RESTRICT="test"

RDEPEND="
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/culsans[${PYTHON_USEDEP}]
		dev-python/eval-type-backport[${PYTHON_USEDEP}]
		dev-python/faker[${PYTHON_USEDEP}]
		dev-python/ftfy[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/more-itertools[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/msgspec[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/orjson[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/sanic[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/uvloop[${PYTHON_USEDEP}]
		tokenizers? (
			dev-python/blobfile[${PYTHON_USEDEP}]
			dev-python/tiktoken[${PYTHON_USEDEP}]
		)
		vision? (
			dev-python/pillow[${PYTHON_USEDEP}]
		)
	')
	$(python_gen_cond_dep '
		tokenizers? ( dev-python/mistral-common[${PYTHON_USEDEP}] )
	' python3_{13..14})
"

src_prepare() {
	# Replace dynamic git-based versioning with hardcoded PV
	sed -i "s/dynamic = \[\"version\"\]/version = \"${PV}\"/" pyproject.toml || die
	sed -i "/setuptools-git-versioning/d" pyproject.toml || die
	# Write a minimal setup.py that does not require setuptools-git-versioning
	cat > setup.py <<-EOF || die
	from setuptools import setup
	setup()
	EOF
	# Pre-write runtime version files used by guidellm internals
	printf '%s' "${PV}" > src/guidellm/version.txt || die
	printf '%s\n' \
		"version = \"${PV}\"" \
		'build_type = "release"' \
		'build_iteration = "0"' \
		'git_commit = ""' \
		'git_branch = ""' \
		"git_last_tag = \"v${PV}\"" \
		> src/guidellm/version.py || die

	distutils-r1_src_prepare
}
