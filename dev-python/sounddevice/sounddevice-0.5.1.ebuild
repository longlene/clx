# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Play and Record Sound with Python"
HOMEPAGE="
	https://github.com/spatialaudio/python-sounddevice
	https://pypi.org/project/sounddevice/
"
SRC_URI="https://github.com/spatialaudio/python-sounddevice/archive/refs/tags/${PV}.tar.gz -> python-${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/portaudio
"
#BDEPEND="
#	test? (
#	)
#"

#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/python-${P}
