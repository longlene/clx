# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

EGIT_COMMIT="9241ae3ef9bac614dd25e45e507e089f888280e0"

DESCRIPTION="Efficient Multi-head Latent Attention Kernels"
HOMEPAGE="
	https://pypi.org/project/FlashMLA/
	https://github.com/deepseek-ai/FlashMLA
"
SRC_URI="https://github.com/deepseek-ai/FlashMLA/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
