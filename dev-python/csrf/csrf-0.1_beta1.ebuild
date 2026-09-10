# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Simply generate and validate BREACH-resistant CSRF tokens"
HOMEPAGE="https://pypi.org/project/csrf/ https://github.com/golightlyb/csrf.py"

LICENSE="FSFAP"
SLOT="0"
KEYWORDS="~amd64"
