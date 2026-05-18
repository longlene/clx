# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1

DESCRIPTION="A language and compiler for custom Deep Learning operations"
HOMEPAGE="
	https://pypi.org/project/triton/
	https://github.com/triton-lang/triton
"
SRC_URI="
	https://files.pythonhosted.org/packages/30/b1/b7507bb9815d403927c8dd51d4158ed2e11751a92dbc118a044f247b6848/triton-3.7.0-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

RESTRICT="test"

S="${WORKDIR}"

QA_PRESTRIPPED="
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libpcsamplingutil.so
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libnvperf_target.so
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libnvperf_host.so
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libcupti.so.2025.1.1
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libcupti.so.12
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libcupti.so
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/lib/cupti/libcheckpoint.so
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/bin/ptxas-blackwell
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/bin/ptxas
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/bin/nvdisasm
	/usr/lib/python3.13/site-packages/triton/backends/nvidia/bin/cuobjdump
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${A}"
}

