# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Official Python library for the DeepL language translation API"
HOMEPAGE="https://github.com/DeepLcom/deepl-python"
SRC_URI="https://github.com/DeepLcom/deepl-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/deepl-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/requests-2.32.5[${PYTHON_USEDEP}]"

RESTRICT="test"
