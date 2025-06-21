# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="6f9656bf091f6cb1ebfe22c926e60e1c9d25ca02"

DESCRIPTION="Flexible Python configuration system"
HOMEPAGE="https://github.com/omry/omegaconf"
SRC_URI="https://github.com/omry/omegaconf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-5.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
