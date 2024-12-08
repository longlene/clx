# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="4c0333854cb905966f8cc4e9a74068c1e507c7b7"

DESCRIPTION="PyTorch implementation of low-rank adaptation"
HOMEPAGE="https://github.com/microsoft/LoRA"
SRC_URI="https://github.com/microsoft/LoRA/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/LoRA-${EGIT_COMMIT}
