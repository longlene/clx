# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="6ff003ed89abc4b64587227d10a6a8ba48309a83"

DESCRIPTION="Simple and tiny yield-based trampoline implementation for python"
HOMEPAGE="
	https://pypi.org/project/trampoline/
	https://gitlab.com/ferreum/trampoline
"
SRC_URI="https://gitlab.com/ferreum/trampoline/-/archive/${EGIT_COMMIT}/trampoline-${EGIT_COMMIT}.tar.gz -> ${P}.gl.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/trampoline-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
