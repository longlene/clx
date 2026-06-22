# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="66f07ca02fc64a9ea2f9b4ad66593b226d473adb"

DESCRIPTION="Unicode grapheme helpers"
HOMEPAGE="
	https://github.com/alvinlindstam/grapheme
	https://pypi.org/project/grapheme/
"
SRC_URI="https://github.com/alvinlindstam/grapheme/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-${EGIT_COMMIT}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
