# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Module for converting between datetime.timedelta and Go's Duration strings"
HOMEPAGE="https://github.com/icholy/durationpy"
SRC_URI="https://github.com/icholy/durationpy/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/durationpy-${PV}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="test? ( dev-python/pytest )"
