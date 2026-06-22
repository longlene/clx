# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python interface to the miniaudio audio playback, recording, decoding and"
HOMEPAGE="
	https://pypi.org/project/miniaudio/
	https://github.com/irmen/pyminiaudio
"
SRC_URI="https://github.com/irmen/pyminiaudio/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/py${P}
KEYWORDS="~amd64"

BDEPEND="
	>=dev-python/cffi-1.12.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
