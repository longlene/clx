# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Supercharging Machine Learning"
HOMEPAGE="
	https://pypi.org/project/comet-ml/
	https://www.comet.com
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/dulwich-0.20.6[${PYTHON_USEDEP}]
	>=dev-python/everett-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-2.6.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.6.3[${PYTHON_USEDEP}]
	dev-python/python-box[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/rich-13.3.2[${PYTHON_USEDEP}]
	>=dev-python/semantic-version-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/sentry-sdk-1.1.0[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.8[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.11.2[${PYTHON_USEDEP}]
	>=dev-python/wurlitzer-1.0.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
