# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="87fff30181cb9e5e6d8f87c9e866a672e7d867a1"

DESCRIPTION="Hanzi Converter for Traditional and Simplified Chinese"
HOMEPAGE="
	https://pypi.org/project/hanziconv/
	https://github.com/berniey/hanziconv
"
SRC_URI="https://github.com/berniey/hanziconv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
