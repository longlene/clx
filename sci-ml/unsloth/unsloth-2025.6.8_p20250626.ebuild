# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="bfa6a3678e2fb8097c5ece41d095a8051f099db3"

DESCRIPTION="2-5X faster LLM finetuning"
HOMEPAGE="
	https://unsloth.ai/
	https://github.com/unslothai/unsloth
"
SRC_URI="https://github.com/unslothai/unsloth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/bitsandbytes[${PYTHON_SINGLE_USEDEP}]
	sci-ml/unsloth-zoo[${PYTHON_SINGLE_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
