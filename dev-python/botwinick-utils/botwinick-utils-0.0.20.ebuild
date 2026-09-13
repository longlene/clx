# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_P=${PN/-/_}-${PV}

DESCRIPTION="Assorted utilities and platform code"
HOMEPAGE="https://github.com/dbotwinick/botwinick_utils"
SRC_URI="https://files.pythonhosted.org/packages/c8/a7/1025c41851109d994c51ea6a24f4e648577d290eb3601a173f6c732f2617/${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
