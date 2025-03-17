# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Slack Developer Kit for Python"
HOMEPAGE="
	https://slack.dev/python-slack-sdk/
	https://github.com/slackapi/python-slack-sdk
"
SRC_URI="https://github.com/slackapi/python-slack-sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}"/python-slack-sdk-${PV}
