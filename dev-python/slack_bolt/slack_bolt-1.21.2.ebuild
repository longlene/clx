# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A framework to build Slack apps using Python"
HOMEPAGE="
	https://slack.dev/bolt-python/
	https://github.com/slackapi/bolt-python
"
SRC_URI="https://github.com/slackapi/bolt-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/slack_sdk-3.25.0[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest

S="${WORKDIR}"/bolt-python-${PV}
