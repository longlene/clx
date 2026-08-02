# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="${PV/_p/.post}"

DESCRIPTION="Configuration library with environment variables and YAML support"
HOMEPAGE="https://github.com/pytroll/donfig"
SRC_URI="https://github.com/pytroll/donfig/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/versioneer[${PYTHON_USEDEP}]
"
