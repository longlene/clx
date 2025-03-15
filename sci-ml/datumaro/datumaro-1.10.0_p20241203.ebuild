# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

EGIT_COMMIT="5f3de9d645a16887b280cd5ee570baae38d7cc59"

CRATES="
	autocfg@1.4.0
	bitflags@2.6.0
	cfg-if@1.0.0
	convert_case@0.4.0
	derive_more@0.99.18
	errno@0.3.10
	fastrand@2.3.0
	heck@0.4.1
	indoc@1.0.9
	itoa@1.0.14
	libc@0.2.169
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	memchr@2.7.4
	memoffset@0.9.1
	once_cell@1.20.2
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	proc-macro2@1.0.92
	pyo3-build-config@0.19.2
	pyo3-ffi@0.19.2
	pyo3-macros-backend@0.19.2
	pyo3-macros@0.19.2
	pyo3@0.19.2
	quote@1.0.38
	redox_syscall@0.5.8
	rustc_version@0.4.1
	rustix@0.38.42
	rustversion@1.0.19
	ryu@1.0.18
	scopeguard@1.2.0
	semver@1.0.24
	serde@1.0.216
	serde_derive@1.0.216
	serde_json@1.0.134
	smallvec@1.13.2
	strum@0.25.0
	strum_macros@0.25.3
	syn@1.0.109
	syn@2.0.92
	target-lexicon@0.12.16
	tempfile@3.14.0
	unicode-ident@1.0.14
	unindent@0.1.11
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
"

inherit cargo distutils-r1

DESCRIPTION="Dataset Management Framework"
HOMEPAGE="https://github.com/openvinotoolkit/datumaro"
SRC_URI="
	https://github.com/openvinotoolkit/datumaro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-2023.2.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-telemetry-2022.1.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/openvino-dev-2023.2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/attrs-21.3.0[${PYTHON_USEDEP}]
		>=dev-python/defusedxml-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/h5py-2.10.0[${PYTHON_USEDEP}]
		>=dev-python/imagesize-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/lxml-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.3.1[${PYTHON_USEDEP}]
		>=dev-python/networkx-2.6[${PYTHON_USEDEP}]
		>=dev-python/nibabel-3.2.1[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23.4[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.10.12[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
		>=dev-python/ruamel-yaml-0.17.0[${PYTHON_USEDEP}]
		>=dev-python/shapely-1.7[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-3.7.4.3[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=dev-python/pycocotools-2.0.4[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
		>=dev-python/tensorboardX-1.8[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/cryptography-38.03[${PYTHON_USEDEP}]
		dev-python/pyemd[${PYTHON_USEDEP}]
		dev-python/pyarrow[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/ovmsclient[${PYTHON_USEDEP}]
		dev-python/tritonclient[${PYTHON_USEDEP}]
		dev-python/scikit-learn[${PYTHON_USEDEP}]
		dev-python/json-stream[${PYTHON_USEDEP}]
		dev-python/nltk[${PYTHON_USEDEP}]
		dev-python/portalocker[${PYTHON_USEDEP}]
		>=dev-python/dvc-3.49.0[${PYTHON_USEDEP}]
		>=dev-python/gitpython-3.1.18[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/pybind11[${PYTHON_USEDEP}]
		dev-python/setuptools-rust[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
