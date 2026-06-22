# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="1.79.3"

DESCRIPTION="Library to easily interface with LLM API providers"
HOMEPAGE="
	https://litellm.ai
	https://github.com/BerriAI/litellm-enterprise
	https://pypi.org/project/litellm/
"
SRC_URI="https://github.com/BerriAI/litellm/archive/refs/tags/v${PV}-nightly.tar.gz -> litellm-${MY_PV}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/litellm-${MY_PV}-nightly/litellm-proxy-extras
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
