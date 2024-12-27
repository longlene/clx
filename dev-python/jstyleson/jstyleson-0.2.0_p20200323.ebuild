# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

EGIT_COMMIT="8c47cc9e665b3b1744cccfaa7a650de5f3c575dd"

DESCRIPTION="Library to parse JSON with js-style comments"
HOMEPAGE="
	https://github.com/linjackson78/jstyleson/
	https://pypi.org/project/jstyleson/
"
SRC_URI="https://github.com/linjackson78/jstyleson/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"

RESTRICT="test"

S="${WORKDIR}"/jstyleson-${EGIT_COMMIT}
