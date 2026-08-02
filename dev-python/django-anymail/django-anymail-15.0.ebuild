# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Django email backends and webhooks for major ESPs"
HOMEPAGE="https://github.com/anymail/django-anymail"
SRC_URI="https://github.com/anymail/django-anymail/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/django-5.0[${PYTHON_USEDEP}]
	dev-python/idna[${PYTHON_USEDEP}]
	>=dev-python/requests-2.4.3[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.25.0[${PYTHON_USEDEP}]
"

RESTRICT="test"

src_prepare() {
	sed -i 's|force-include.*README.*||' pyproject.toml || die
	distutils-r1_src_prepare
}
