# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 pypi

DESCRIPTION="English language files for gruut tokenizer/phonemizer"
HOMEPAGE="
	https://github.com/rhasspy/gruut
	https://pypi.org/project/gruut/
"
SRC_URI="https://github.com/rhasspy/gruut/archive/refs/tags/v${PV}.tar.gz -> gruut-${PV}.tar.gz"

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

S="${WORKDIR}"/gruut-${PV}/${PN}

