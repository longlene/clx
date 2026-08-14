# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 optfeature pypi

DESCRIPTION="Run JavaScript code from Python"
HOMEPAGE="
	https://pypi.org/project/exejs/
	https://github.com/UlionTse/exejs
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest

pkg_postinst() {
	optfeature "running JavaScript via Node.js" net-libs/nodejs
}
