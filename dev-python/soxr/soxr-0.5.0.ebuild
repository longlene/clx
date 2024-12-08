# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

LIBSOXR_COMMIT="edbdb4081db14eb21729b57c4f2c813514ad0259"

DESCRIPTION="Fast and high quality sample-rate conversion library for Python"
HOMEPAGE="
	https://github.com/dofuuz/python-soxr
"
SRC_URI="
	https://github.com/dofuuz/python-soxr/archive/refs/tags/v${PV}.tar.gz -> python-${P}.gh.tar.gz
	https://github.com/dofuuz/soxr/archive/${LIBSOXR_COMMIT}.tar.gz -> soxr-${LIBSOXR_COMMIT}.gh.tar.gz
	"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/scikit-build-core-0.10[${PYTHON_USEDEP}]
	>=dev-python/nanobind-2[${PYTHON_USEDEP}]
	>=dev-python/setuptools-45[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-6.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/python-${P}

src_prerpare() {
	default
	rmdir libsoxr && mv "${WORKDIR}"/soxr-${LIBSOXR_COMMIT} libsoxr
	distutils-r1_src_prepare
}
