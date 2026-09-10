# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_13 python3_14 )

inherit distutils-r1

DESCRIPTION="AI compute engine"
HOMEPAGE="
	https://pypi.org/project/ray/
	https://github.com/ray-project/ray
	https://ray.io/
"

SRC_URI="
	python_targets_python3_13? ( https://files.pythonhosted.org/packages/ae/1f/59306bf0583844fc935497c7400b30abf3914d85c6a0fd664d5cf184d6ef/${P}-cp313-cp313-manylinux2014_x86_64.whl )
	python_targets_python3_14? ( https://files.pythonhosted.org/packages/36/15/b684b53e67a2d9da4bfb3ebadf2a4ddec8c7ca170689647b4057a2b42437/${P}-cp314-cp314-manylinux2014_x86_64.whl )
"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-7.0[${PYTHON_USEDEP}]
	dev-python/filelock[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.3[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

QA_PRESTRIPPED="
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_websocket/mask.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_http_writer.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/frozenlist/_frozenlist.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/yarl/_quoting_c.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/multidict/_multidict.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/propcache/_helpers_c.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_websocket/reader_c.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_http_parser.cpython-*-x86_64-linux-gnu.so
	/usr/lib/python3.*/site-packages/ray/thirdparty_files/psutil/_psutil_linux.abi3.so
	/usr/lib/python3.*/site-packages/ray/core/libjemalloc.so
	/usr/lib/python3.*/site-packages/ray/_raylet.so
	/usr/lib/python3.*/site-packages/ray/core/src/ray/raylet/raylet
	/usr/lib/python3.*/site-packages/ray/core/src/ray/gcs/gcs_server
"

python_compile() {
	local cp_tag="cp${EPYTHON#python}"
	cp_tag="${cp_tag/./}"
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${P}-${cp_tag}-${cp_tag}-manylinux2014_x86_64.whl"
}
