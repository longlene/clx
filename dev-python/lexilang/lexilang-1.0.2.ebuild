# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Simple, fast dictionary-based language detector for short texts"
HOMEPAGE="https://github.com/LibreTranslate/LexiLang"
SRC_URI="https://github.com/LibreTranslate/LexiLang/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest

S="${WORKDIR}"/LexiLang-${PV}
