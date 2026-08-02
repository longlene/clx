# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Helper functions and classes for the Datastar library"
HOMEPAGE="https://github.com/starfederation/datastar-python"
SRC_URI="https://github.com/starfederation/datastar-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/datastar-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"
