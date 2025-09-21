# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

EGIT_COMMOT="57690d7c4e8b5e88dad07d67278f613a739e6d13"

DESCRIPTION="A framework for elegantly configuring complex applications"
HOMEPAGE="
	https://hydra.cc/
	https://github.com/facebookresearch/hydra
"
SRC_URI="https://github.com/facebookresearch/hydra/archive/${EGIT_COMMOT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/omegaconf-2.4.0[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
