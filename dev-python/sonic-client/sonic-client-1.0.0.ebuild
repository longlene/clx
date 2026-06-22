# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python client for the Sonic search backend"
HOMEPAGE="https://github.com/xmonader/python-sonic-client https://pypi.org/project/sonic-client/"
SRC_URI="https://files.pythonhosted.org/packages/29/47/5c356456e5dc3ba3f52d88a6b4d0661bdbe44a6a2340b3ca04005504c8ab/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
