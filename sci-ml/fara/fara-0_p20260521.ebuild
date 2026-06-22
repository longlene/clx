# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

COMMIT="796ae4f2bf91a5a31b809fe621fb4ced6eab63b1"

DESCRIPTION="Fara-7B: an efficient agentic model for computer use via browser"
HOMEPAGE="https://github.com/microsoft/fara"
SRC_URI="https://github.com/microsoft/fara/archive/${COMMIT}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/fara-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ollama vllm"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/jsonschema[${PYTHON_USEDEP}]
		ollama? ( dev-python/ollama[${PYTHON_USEDEP}] )
	')
	vllm? ( sci-ml/vllm )
"
DEPEND="${RDEPEND}"
