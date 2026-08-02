# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Minimal, zero-bloat LLM API wrapper, drop-in replacement for litellm"
HOMEPAGE="https://github.com/unclecode/litellm"
SRC_URI="https://github.com/unclecode/litellm/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/nanollm-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aws gcp"
RESTRICT="test"

RDEPEND="
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	aws? ( dev-python/boto3[${PYTHON_USEDEP}] )
	gcp? ( >=dev-python/google-auth-2.0.0[${PYTHON_USEDEP}] )
"
