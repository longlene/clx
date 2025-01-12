# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Aider is AI pair programming in your terminal"
HOMEPAGE="
	https://aider.chat/
	https://github.com/Aider-AI/aider
"
SRC_URI="
	https://github.com/Aider-AI/aider/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	>=sci-misc/litellm-1.53.9[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/tokenizers-0.19.1[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/aiohappyeyeballs-2.4.4[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.11.10[${PYTHON_USEDEP}]
		>=dev-python/aiosignal-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/annotated-types-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.7.0[${PYTHON_USEDEP}]
		>=dev-python/attrs-24.2.0[${PYTHON_USEDEP}]
		>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.12.3[${PYTHON_USEDEP}]
		>=dev-python/certifi-2024.8.30[${PYTHON_USEDEP}]
		>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
		>=dev-python/charset-normalizer-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		>=dev-python/configargparse-1.7[${PYTHON_USEDEP}]
		>=dev-python/diff-match-patch-20241021[${PYTHON_USEDEP}]
		>=dev-python/diskcache-5.6.3[${PYTHON_USEDEP}]
		>=dev-python/distro-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
		>=dev-python/flake8-7.1.1[${PYTHON_USEDEP}]
		>=dev-python/frozenlist-1.5.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2024.10.0[${PYTHON_USEDEP}]
		>=dev-python/gitdb-4.0.11[${PYTHON_USEDEP}]
		>=dev-python/gitpython-3.1.43[${PYTHON_USEDEP}]
		>=dev-python/grep-ast-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/h11-0.14.0[${PYTHON_USEDEP}]
		>=dev-python/httpcore-1.0.7[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
		>=sci-libs/huggingface_hub-0.26.5[${PYTHON_USEDEP}]
		>=dev-python/idna-3.10[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-7.2.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
		>=dev-python/jiter-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/json5-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.23.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-specifications-2024.10.1[${PYTHON_USEDEP}]
		>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/markupsafe-3.0.2[${PYTHON_USEDEP}]
		>=dev-python/mccabe-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/mdurl-0.1.2[${PYTHON_USEDEP}]
		>=dev-python/mixpanel-4.10.1[${PYTHON_USEDEP}]
		>=dev-python/multidict-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/networkx-3.2.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/openai-1.57.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
		>=dev-python/pathspec-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/pexpect-4.9.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.4.0[${PYTHON_USEDEP}]
		>=dev-python/posthog-3.7.4[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0.48[${PYTHON_USEDEP}]
		>=dev-python/propcache-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.1.0[${PYTHON_USEDEP}]
		>=dev-python/ptyprocess-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/pycodestyle-2.12.1[${PYTHON_USEDEP}]
		>=dev-python/pycparser-2.22[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.10.3[${PYTHON_USEDEP}]
		>=dev-python/pydantic-core-2.27.1[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/pyflakes-3.2.0[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.18.0[${PYTHON_USEDEP}]
		>=dev-python/pypandoc-1.14[${PYTHON_USEDEP}]
		>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/referencing-0.35.1[${PYTHON_USEDEP}]
		>=dev-python/regex-2024.11.6[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
		>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
		>=dev-python/rpds-py-0.22.3[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.13.1[${PYTHON_USEDEP}]
		>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
		>=dev-python/smmap-5.0.1[${PYTHON_USEDEP}]
		>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/sounddevice-0.5.1[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/soupsieve-2.6[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.8.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.67.1[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-0.21.3[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-languages-1.10.2[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.2.3[${PYTHON_USEDEP}]
		>=dev-python/watchfiles-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/wcwidth-0.2.13[${PYTHON_USEDEP}]
		>=dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
		>=dev-python/zipp-3.21.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

