# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

EGIT_COMMIT="8cc3a45eff9a5a4ead09cd84639a92fed7dbddae"

DESCRIPTION="AJP package crafting library"
HOMEPAGE="https://github.com/hypn0s/AJPy/"
SRC_URI="https://github.com/hypn0s/AJPy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/AJPy-${EGIT_COMMIT}
