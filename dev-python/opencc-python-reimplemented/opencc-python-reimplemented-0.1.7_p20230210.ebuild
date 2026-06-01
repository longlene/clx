# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

EGIT_COMMIT="b85452e384a3650109809fe5fefacb2ae4fe89d2"

DESCRIPTION="Open Chinese convert (OpenCC) in pure Python"
HOMEPAGE="https://github.com/yichen0831/opencc-python"
SRC_URI="https://github.com/yichen0831/opencc-python/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/opencc-python-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

RESTRICT="test"
