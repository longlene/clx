# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="cea0fd5e40a647166fc9bd0617776aa480424e1d"

DESCRIPTION="Makes playwright stealthy like a ninja!"
HOMEPAGE="
	https://pypi.org/project/tf-playwright-stealth/
	https://github.com/tinyfish-io/tf-playwright-stealth
"
SRC_URI="https://github.com/tinyfish-io/tf-playwright-stealth/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	|| (
		dev-python/playwright-bin[${PYTHON_USEDEP}]
		dev-python/playwright[${PYTHON_USEDEP}]
	)
	>=dev-python/fake-http-header-0.3.5[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
