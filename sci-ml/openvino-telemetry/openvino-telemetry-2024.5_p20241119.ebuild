# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="4a7e3b6672a488910e3910f045c7cd0da889b1c5"

DESCRIPTION="OpenVINO Telemetry"
HOMEPAGE="
	https://github.com/openvinotoolkit/telemetry
"
SRC_URI="
	https://github.com/openvinotoolkit/telemetry/archive/${EGIT_COMMIT}.tar.gz -> ${PN}-${EGIT_COMMIT}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"

RESTRICT="test"

S="${WORKDIR}"/telemetry-${EGIT_COMMIT}

