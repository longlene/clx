# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

EGIT_COMMIT="9fdb6558304b7786f1ce86e796be7966b48f640c"

DESCRIPTION="Korean Lunar Calendar"
HOMEPAGE="https://github.com/usingsky/korean_lunar_calendar_py"
SRC_URI="https://github.com/usingsky/korean_lunar_calendar_py/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/korean_lunar_calendar_py-${EGIT_COMMIT}
KEYWORDS="~amd64"

distutils_enable_tests pytest
