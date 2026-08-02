# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Django FileResponse subclass that adds Content-Range headers"
HOMEPAGE="https://github.com/wearespindle/django-ranged-fileresponse"
SRC_URI="https://github.com/wearespindle/django-ranged-fileresponse/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/django-ranged-fileresponse-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND=">=dev-python/django-2.0[${PYTHON_USEDEP}]"
