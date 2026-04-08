# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A fast and lightweight python-based CTC beam search decoder for speech recognition"
HOMEPAGE="
	https://pypi.org/project/pyctcdecode/
	https://github.com/kensho-technologies/pyctcdecode
"
SRC_URI="https://github.com/kensho-technologies/pyctcdecode/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
