# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python client library for the NVIDIA Riva ASR/TTS APIs"
HOMEPAGE="
	https://pypi.org/project/nvidia-riva-client/
	https://github.com/nvidia-riva/python-clients
"
# Wheel-only PyPI release (the nvidia-riva/python-clients GitHub tags lag
# behind PyPI versions), so package the official pure-Python wheel directly.
WHL="nvidia_riva_client-${PV}-py3-none-any.whl"
SRC_URI="
	https://files.pythonhosted.org/packages/ab/e2/f8cef2a9d10e2bace3103b7ecd7b4099f4e38358de17556019686739ebfb/${WHL}
"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Upstream conservatively pins websockets<16 and protobuf==6.33.5 in the
# wheel metadata; the tree carries newer versions (websockets 17.x,
# protobuf 7.x) that satisfy the grpc client usage, so relax the ceilings
# (floors kept) to allow resolution against the tree.
RDEPEND="
	>=dev-python/grpcio-1.67.1[${PYTHON_USEDEP}]
	<dev-python/grpcio-2[${PYTHON_USEDEP}]
	>=dev-python/grpcio-tools-1.67.1[${PYTHON_USEDEP}]
	<dev-python/grpcio-tools-2[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
"

RESTRICT="test"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${WHL}"
}
