# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

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
	>=sci-ml/tokenizers-0.21.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.34.3[${PYTHON_SINGLE_USEDEP}]
	>=dev-libs/tree-sitter-c-sharp-0.23.1
	>=dev-libs/tree-sitter-embedded-template-0.23.2
	$(python_gen_cond_dep '
		>=dev-python/aiohappyeyeballs-2.6.1[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.12.15[${PYTHON_USEDEP}]
		>=dev-python/aiosignal-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/annotated-types-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/anyio-4.10.0[${PYTHON_USEDEP}]
		>=dev-python/attrs-25.3.0[${PYTHON_USEDEP}]
		>=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/beautifulsoup4-4.13.4[${PYTHON_USEDEP}]
		>=dev-python/cachetools-5.5.2[${PYTHON_USEDEP}]
		>=dev-python/certifi-2025.8.3[${PYTHON_USEDEP}]
		>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
		>=dev-python/charset-normalizer-3.4.2[${PYTHON_USEDEP}]
		>=dev-python/click-8.2.1[${PYTHON_USEDEP}]
		>=dev-python/configargparse-1.7.1[${PYTHON_USEDEP}]
		>=dev-python/diff-match-patch-20241021[${PYTHON_USEDEP}]
		>=dev-python/diskcache-5.6.3[${PYTHON_USEDEP}]
		>=dev-python/distro-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.18.0[${PYTHON_USEDEP}]
		>=dev-python/flake8-7.3.0[${PYTHON_USEDEP}]
		>=dev-python/frozenlist-1.7.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2025.7.0[${PYTHON_USEDEP}]
		>=dev-python/gitdb-4.0.12[${PYTHON_USEDEP}]
		>=dev-python/gitpython-3.1.45[${PYTHON_USEDEP}]
		>=dev-python/google-ai-generativelanguage-0.6.15[${PYTHON_USEDEP}]
		>=dev-python/google-api-core-2.25.1[${PYTHON_USEDEP}]
		>=dev-python/google-api-python-client-2.178.0[${PYTHON_USEDEP}]
		>=dev-python/google-auth-2.40.3[${PYTHON_USEDEP}]
		>=dev-python/google-auth-httplib2-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/google-generativeai-0.8.5[${PYTHON_USEDEP}]
		>=dev-python/googleapis-common-protos-1.70.0[${PYTHON_USEDEP}]
		>=dev-python/grep-ast-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.74.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-status-1.71.2[${PYTHON_USEDEP}]
		>=dev-python/h11-0.16.0[${PYTHON_USEDEP}]
		>=sci-ml/hf_xet-1.1.7[${PYTHON_USEDEP}]
		>=dev-python/httpcore-1.0.9[${PYTHON_USEDEP}]
		>=dev-python/httplib2-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
		>=dev-python/idna-3.10[${PYTHON_USEDEP}]
		>=dev-python/importlib-metadata-7.2.1[${PYTHON_USEDEP}]
		>=dev-python/importlib-resources-6.5.2[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		>=dev-python/jiter-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/json5-0.12.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-4.25.0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-specifications-2025.4.1[${PYTHON_USEDEP}]
		>=dev-python/markdown-it-py-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/markupsafe-3.0.2[${PYTHON_USEDEP}]
		>=dev-python/mccabe-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/mdurl-0.1.2[${PYTHON_USEDEP}]
		>=dev-python/mixpanel-4.10.1[${PYTHON_USEDEP}]
		>=dev-python/multidict-6.6.3[${PYTHON_USEDEP}]
		>=dev-python/networkx-3.4.2[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/openai-1.99.1[${PYTHON_USEDEP}]
		>=dev-python/oslex-0.1.3[${PYTHON_USEDEP}]
		>=dev-python/packaging-25.0[${PYTHON_USEDEP}]
		>=dev-python/pathspec-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/pexpect-4.9.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-11.3.0[${PYTHON_USEDEP}]
		>=dev-python/posthog-6.4.1[${PYTHON_USEDEP}]
		>=dev-python/prompt-toolkit-3.0.51[${PYTHON_USEDEP}]
		>=dev-python/propcache-0.3.2[${PYTHON_USEDEP}]
		>=dev-python/proto-plus-1.26.1[${PYTHON_USEDEP}]
		>=dev-python/protobuf-5.29.5[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/ptyprocess-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/pyasn1-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/pyasn1-modules-0.4.2[${PYTHON_USEDEP}]
		>=dev-python/pycodestyle-2.14.0[${PYTHON_USEDEP}]
		>=dev-python/pycparser-2.22[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11.7[${PYTHON_USEDEP}]
		>=dev-python/pydantic-core-2.33.2[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/pyflakes-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/pygments-2.19.2[${PYTHON_USEDEP}]
		>=dev-python/pypandoc-1.15[${PYTHON_USEDEP}]
		>=dev-python/pyparsing-3.2.3[${PYTHON_USEDEP}]
		>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
		>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.1.1[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/referencing-0.36.2[${PYTHON_USEDEP}]
		>=dev-python/regex-2025.7.34[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
		>=dev-python/rich-14.1.0[${PYTHON_USEDEP}]
		>=dev-python/rpds-py-0.27.0[${PYTHON_USEDEP}]
		>=dev-python/rsa-4.9.1[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.15.3[${PYTHON_USEDEP}]
		>=dev-python/shtab-1.7.2[${PYTHON_USEDEP}]
		>=dev-python/six-1.17.0[${PYTHON_USEDEP}]
		>=dev-python/smmap-5.0.2[${PYTHON_USEDEP}]
		>=dev-python/sniffio-1.3.1[${PYTHON_USEDEP}]
		>=dev-python/socksio-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/sounddevice-0.5.2[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/soupsieve-2.7[${PYTHON_USEDEP}]
		>=dev-python/tiktoken-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.67.1[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/tree-sitter-language-pack-0.9.0[${PYTHON_USEDEP}]
		>=dev-libs/tree-sitter-yaml-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.14.1[${PYTHON_USEDEP}]
		>=dev-python/typing-inspection-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/uritemplate-4.2.0[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.5.0[${PYTHON_USEDEP}]
		>=dev-python/watchfiles-1.1.0[${PYTHON_USEDEP}]
		>=dev-python/wcwidth-0.2.13[${PYTHON_USEDEP}]
		>=dev-python/yarl-1.20.1[${PYTHON_USEDEP}]
		>=dev-python/zipp-3.23.0[${PYTHON_USEDEP}]
	')
"
BDEPEND=""

