# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="Variables defined by the XDG Base Directory Specification"
HOMEPAGE="
	https://pypi.org/project/xdg-base-dirs/
	https://github.com/srstevenson/xdg-base-dirs
"
SRC_URI="https://github.com/srstevenson/xdg-base-dirs/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
