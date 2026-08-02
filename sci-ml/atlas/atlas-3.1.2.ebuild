# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Adaptive Test-time Learning and Autonomous Specialization"
HOMEPAGE="https://github.com/itigges22/ATLAS"
SRC_URI="https://github.com/itigges22/ATLAS/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ATLAS-${PV}"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
