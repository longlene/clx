# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11,12} )
inherit distutils-r1

ION_C_COMMIT="6d4de4150fe162dde3fad55cefee8d3ec64fb974"

DESCRIPTION="A Python implementation of Amazon Ion"
HOMEPAGE="https://github.com/amzn/ion-python"
SRC_URI="
	https://github.com/amazon-ion/ion-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/amzn/ion-c/archive/${ION_C_COMMIT}.tar.gz -> ion-c-${ION_C_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/jsonconversion[${PYTHON_USEDEP}]
"
BDEPEND=""

python_prepare_all() {
	default
	rmdir ion-c && ln -sv "${WORKDIR}"/ion-c-${ION_C_COMMIT} ion-c
	sed -e '/option(IONC_BUILD_TESTS/{s#ON)#OFF)#}' \
		-i ion-c/CMakeLists.txt
	eapply "${FILESDIR}"/ion-python-0.11.3-install.patch
	distutils-r1_python_prepare_all
}
