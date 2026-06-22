# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="AI compute engine"
HOMEPAGE="
	https://pypi.org/project/ray/
	https://github.com/ray-project/ray
	https://ray.io/
"

SRC_URI="
	https://files.pythonhosted.org/packages/72/6c/97bd20bc62e5dc1b40784261e38f5fce9aee9765c51332a41e95083507a1/ray-2.55.0-cp313-cp313-manylinux2014_x86_64.whl
"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"
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
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_websocket/mask.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_http_writer.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/frozenlist/_frozenlist.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/yarl/_quoting_c.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/multidict/_multidict.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/propcache/_helpers_c.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_websocket/reader_c.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/_private/runtime_env/agent/thirdparty_files/aiohttp/_http_parser.cpython-313-x86_64-linux-gnu.so
   /usr/lib/python3.13/site-packages/ray/thirdparty_files/psutil/_psutil_linux.abi3.so
   /usr/lib/python3.13/site-packages/ray/core/libjemalloc.so
   /usr/lib/python3.13/site-packages/ray/_raylet.so
   /usr/lib/python3.13/site-packages/ray/core/src/ray/raylet/raylet
   /usr/lib/python3.13/site-packages/ray/core/src/ray/gcs/gcs_server
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}
