# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

DESCRIPTION="Open-source autonomous vehicle simulation platform for E2E AV policies"
HOMEPAGE="https://github.com/NVlabs/alpasim"
SRC_URI="https://github.com/NVlabs/alpasim/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Sub-packages built: plugins, grpc, eval, utils, controller, physics, runtime, tools, wizard
# Excluded: driver (uv_build backend), utils_rs (maturin/Rust), trafficsim (no build-system)
RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/grpcio[${PYTHON_USEDEP}]
		>=dev-python/dataclasses-json-0.6.7[${PYTHON_USEDEP}]
		>=dev-python/typing-inspect-0.9.0[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/aiofiles[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/protobuf-4.0.0[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/seaborn[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/shapely[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/csaps[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/polars-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-15.0.0[${PYTHON_USEDEP}]
		>=dev-python/prometheus-client-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/filelock[${PYTHON_USEDEP}]
		dev-python/imageio[${PYTHON_USEDEP}]
		>=dev-python/mergedeep-1.3.4[${PYTHON_USEDEP}]
		>=dev-python/hydra-core-1.0[${PYTHON_USEDEP}]
		dev-python/gitpython[${PYTHON_USEDEP}]
		dev-python/boto3[${PYTHON_USEDEP}]
		dev-python/do-mpc[${PYTHON_USEDEP}]
		dev-python/osqp[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-11.5.0[${PYTHON_USEDEP}]
		app-misc/warp[${PYTHON_USEDEP}]
		sci-libs/trajdata[${PYTHON_USEDEP}]
		media-libs/opencv[python,${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/hatchling[${PYTHON_USEDEP}]
		dev-python/grpcio-tools[${PYTHON_USEDEP}]
	')
"

python_compile() {
	local subpkgs=(
		src/plugins
		src/grpc
		src/eval
		src/utils
		src/controller
		src/physics
		src/runtime
		src/tools
		src/wizard
	)
	local subpkg
	for subpkg in "${subpkgs[@]}"; do
		pushd "${S}/${subpkg}" || die
		distutils-r1_python_compile
		popd || die
	done
}
