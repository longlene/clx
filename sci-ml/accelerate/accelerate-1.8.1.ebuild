# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A simple way to train and use PyTorch models with multi-GPU, TPU, mixed-precision"
HOMEPAGE="https://github.com/huggingface/accelerate"
SRC_URI="https://github.com/huggingface/accelerate/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.21.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/numpy-1.17.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="test? (
	sci-ml/caffe2[gloo]
)"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		tests/test_examples.py
		tests/deepspeed
		tests/test_big_modeling.py
		tests/fsdp
		tests/tp
		tests/test_cli.py
	)
	local EPYTEST_DESELECT=(
		tests/test_modeling_utils.py::ModelingUtilsTester::test_infer_auto_device_map_with_buffer_check
		tests/test_modeling_utils.py::ModelingUtilsTester::test_infer_auto_device_map_with_buffer_check_and_multi_devices
		tests/test_modeling_utils.py::ModelingUtilsTester::test_infer_auto_device_map_with_fallback_allocation_and_buffers
		tests/test_utils.py::UtilsTester::test_patch_environment_key_exists
	)
	epytest tests
}
