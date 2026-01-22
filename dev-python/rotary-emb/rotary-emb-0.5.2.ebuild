# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="rotary emb"
HOMEPAGE="
	https://pypi.org/project/rotary-emb/
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	sci-ml/caffe2[cuda]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
