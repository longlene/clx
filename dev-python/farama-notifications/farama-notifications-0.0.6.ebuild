# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Notifications for all Farama Foundation maintained libraries"
HOMEPAGE="https://github.com/Farama-Foundation/Farama-Notifications https://pypi.org/project/farama-notifications/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
