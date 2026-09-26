# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="i18n translation string utility for Repoze and Pyramid"
HOMEPAGE="https://github.com/Pylons/translationstring"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${PYTHON_DEPS}"

RESTRICT="test"
