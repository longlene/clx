# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="VirtualPathDictChains - hierarchical settings management using YAML"
HOMEPAGE="https://github.com/dbotwinick/python-vpd"
SRC_URI="https://files.pythonhosted.org/packages/fe/cf/415c76d473bc09f8dd707c9fe94338078e48f683caba1f1583f1b471c709/vpd-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
