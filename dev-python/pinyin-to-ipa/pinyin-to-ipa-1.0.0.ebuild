# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Command-line interface and Python library to transcribe pinyin to IPA"
HOMEPAGE="
	https://pypi.org/project/pinyin-to-ipa/
	https://github.com/stefantaubert/pinyin-to-ipa
"
SRC_URI="https://github.com/stefantaubert/pinyin-to-ipa/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/ordered-set-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/pypinyin-0.54[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
