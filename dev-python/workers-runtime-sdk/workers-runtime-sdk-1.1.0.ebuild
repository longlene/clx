# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python SDK for Cloudflare Workers"
HOMEPAGE="
	https://pypi.org/project/workers-runtime-sdk/
	https://github.com/cloudflare/workers-py/
"
SRC_URI="https://github.com/cloudflare/workers-py/archive/refs/tags/${PN}-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
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

S="${WORKDIR}"/workers-py-${PN}-v${PV}/packages/${PN}
