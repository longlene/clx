# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 vcs-snapshot

EGIT_COMMIT="8016904297db122869f2fb765c30557a9dddffcc"

DESCRIPTION="Python JSON parser for reading JSON objects out of JS files"
HOMEPAGE="
	https://pypi.org/project/dirtyjson/
	https://github.com/codecobblers/dirtyjson
"
SRC_URI="https://github.com/codecobblers/dirtyjson/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
