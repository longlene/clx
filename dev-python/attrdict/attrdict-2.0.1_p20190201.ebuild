# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

EGIT_COMMIT="8c1883162178a124ee29144ca7abcd83cbd9d222"

DESCRIPTION="A dictionary that allows attribute-style access"
HOMEPAGE="
	https://pypi.org/project/attrdict/
	https://github.com/bcj/AttrDict
"
SRC_URI="https://github.com/bcj/AttrDict/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

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

S="${WORKDIR}"/AttrDict-${EGIT_COMMIT}
