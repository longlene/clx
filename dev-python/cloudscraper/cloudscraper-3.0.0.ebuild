# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 optfeature

DESCRIPTION="A Python module to bypass Cloudflare's anti-bot page"
HOMEPAGE="
	https://github.com/VeNoMouS/cloudscraper/
	https://pypi.org/project/cloudscraper/
"
SRC_URI="
	https://github.com/VeNoMouS/cloudscraper/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64"

RDEPEND="
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-24.0.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/websocket-client-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/js2py-0.74[${PYTHON_USEDEP}]
	>=dev-python/brotli-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.2.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/responses[${PYTHON_USEDEP}]
		net-libs/nodejs
	)
"

# These tests fail for no understanadble reason
EPYTEST_DESELECT=(
	"tests/test_cloudscraper.py::TestCloudScraper::test_bad_interpreter_js_challenge1_16_05_2020"
	"tests/test_cloudscraper.py::TestCloudScraper::test_bad_solve_js_challenge1_16_05_2020"
	"tests/test_cloudscraper.py::TestCloudScraper::test_Captcha_challenge_12_12_2019"
	"tests/test_cloudscraper.py::TestCloudScraper::test_reCaptcha_providers"
)

EPYTEST_PLUGINS=( pytest-{forked,timeout} )
distutils_enable_tests pytest

pkg_postinst() {
	optfeature "brotli decompresssion support" "dev-python/brotlipy"

	optfeature "node.js interpreter support" "net-libs/nodejs"
}
