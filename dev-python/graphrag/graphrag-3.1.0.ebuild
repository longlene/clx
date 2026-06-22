# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
# requires-python = ">=3.11,<3.14"; extended to 3.14 for Gentoo (pure Python)
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="A modular graph-based Retrieval-Augmented Generation (RAG) system"
HOMEPAGE="https://microsoft.github.io/graphrag/ https://github.com/microsoft/graphrag"
SRC_URI="https://github.com/microsoft/graphrag/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aiofiles[${PYTHON_USEDEP}]
		dev-python/azure-core[${PYTHON_USEDEP}]
		dev-python/azure-cosmos[${PYTHON_USEDEP}]
		dev-python/azure-identity[${PYTHON_USEDEP}]
		dev-python/azure-search-documents[${PYTHON_USEDEP}]
		dev-python/azure-storage-blob[${PYTHON_USEDEP}]
		dev-python/blis[${PYTHON_USEDEP}]
		dev-python/devtools[${PYTHON_USEDEP}]
		dev-python/graspologic-native[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/json-repair[${PYTHON_USEDEP}]
		dev-python/lancedb[${PYTHON_USEDEP}]
		dev-python/litellm[${PYTHON_USEDEP}]
		dev-python/markitdown[${PYTHON_USEDEP}]
		dev-python/nest-asyncio2[${PYTHON_USEDEP}]
		dev-python/networkx[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/spacy[${PYTHON_USEDEP}]
		dev-python/textblob[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/typer[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	')
"

# Build all workspace packages in dependency order, installing each
# wheel into the same BUILD_DIR/install tree so the eclass post-phase
# and distutils-r1_python_install work as expected.
_GRAPHRAG_SUBPKGS=(
	graphrag-common
	graphrag-storage
	graphrag-cache
	graphrag-chunking
	graphrag-input
	graphrag-llm
	graphrag-vectors
	graphrag
)

python_compile() {
	local pkg
	for pkg in "${_GRAPHRAG_SUBPKGS[@]}"; do
		pushd "${S}/packages/${pkg}" || die
		distutils_pep517_install "${BUILD_DIR}/install"
		popd || die
	done
}
