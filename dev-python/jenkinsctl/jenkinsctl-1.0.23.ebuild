# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="
	https://pypi.org/project/jenkinsctl/
	https://github.com/amanshaw4511/jenkinsctl/
"
SRC_URI="https://github.com/amanshaw4511/jenkinsctl/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	>=dev-python/dynaconf-3.2.6[${PYTHON_USEDEP}]
	>=dev-python/rich-13.8[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
	>=dev-python/click-completion-0.5.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
