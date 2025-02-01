# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Library for manipulating International Phonetic Alphabet (IPA) pronunciations"
HOMEPAGE="
	https://github.com/rhasspy/gruut-ipa
	https://pypi.org/project/gruut-ipa/
"
SRC_URI="https://github.com/rhasspy/gruut-ipa/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

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

src_prepare() {
	default
	rm -rf tests
	distutils-r1_src_prepare
}
