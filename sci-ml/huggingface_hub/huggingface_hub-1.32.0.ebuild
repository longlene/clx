# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1

DESCRIPTION="a client library to interact with the Hugging Face Hub"
HOMEPAGE="
	https://pypi.org/project/huggingface_hub/
	https://github.com/huggingface/huggingface_hub
"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/click-8.4.2[${PYTHON_USEDEP}]
		<dev-python/click-9.0.0[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.10.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2023.5.0[${PYTHON_USEDEP}]
		>=sci-ml/hf_xet-1.5.2[${PYTHON_USEDEP}]
		<sci-ml/hf_xet-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
		<dev-python/httpx-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.42.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	test? (
		sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
		dev-vcs/git-lfs
	)
"

# Disable the agent-harness "fingerprinting" machinery (utils/_detect_agent.py):
# upstream has it phone home to {ENDPOINT}/api/agent-harnesses and match local env
# vars against the returned registry to guess which AI coding agent/tool invoked
# the process, then appends "agent/<name>" to every request's User-Agent for their
# own usage telemetry (see huggingface/huggingface_hub#4860, and the false-positive
# Warp-terminal misdetection it also causes as a side effect of the same code path).
# detect_agent() is patched to always return None: no registry fetch, no attribution
# ever sent, and the CLI's own is_agent()-driven output-mode/progress-bar switch
# (which shared the same misdetection bug) simply never fires either.
PATCHES=(
	"${FILESDIR}/${P}-disable-agent-fingerprint.patch"
)

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_test() {
	local EPYTEST_IGNORE=(
		contrib
		tests/test_cache_layout.py
		#tests/test_cache_no_symlinks.py
		#tests/test_command_delete_cache.py
		tests/test_commit_scheduler.py
		tests/test_file_download.py
		tests/test_hf_api.py
		tests/test_hf_file_system.py
		#tests/test_inference_api.py
		#tests/test_inference_client.py
		tests/test_oauth.py
		tests/test_repocard.py
		#tests/test_repository.py
		tests/test_snapshot_download.py
		tests/test_utils_telemetry.py
		#tests/test_xet_download.py
		tests/test_xet_upload.py
		tests/test_utils_cache.py
		#tests/test_utils_http.py
		tests/test_webhooks_server.py
	)

	local EPYTEST_DESELECT=(
		#tests/test_cli.py::TestJobsCommand::test_uv_local_script
		tests/test_hub_mixin.py::HubMixinTest::test_push_to_hub
		tests/test_hub_mixin_pytorch.py::PytorchHubMixinTest::test_push_to_hub
		#tests/test_inference_async_client.py::test_async_generate_timeout_error
		#tests/test_inference_providers.py::TestHFInferenceProvider::test_prepare_mapping_info_unknown_task
		#tests/test_offline_utils.py::test_offline_with_timeout
		#tests/test_utils_pagination.py::TestPagination::test_paginate_hf_api

	)

	distutils-r1_src_test
}
