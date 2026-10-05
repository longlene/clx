# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# playwright-core npm package that makes up the driver; must match DRIVER_VERSION
PW_CORE_PV=${PV}

DESCRIPTION="High-level API to automate Chromium, Firefox and WebKit browsers"
HOMEPAGE="
	https://playwright.dev/python/
	https://github.com/microsoft/playwright-python
	https://pypi.org/project/playwright/
"
SRC_URI="
	https://github.com/microsoft/playwright-python/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://registry.npmjs.org/playwright-core/-/playwright-core-${PW_CORE_PV}.tgz
"
S="${WORKDIR}/playwright-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
# tests need downloaded browser builds
RESTRICT="test"

RDEPEND="
	>=dev-python/greenlet-3.1.1[${PYTHON_USEDEP}]
	<dev-python/greenlet-4[${PYTHON_USEDEP}]
	>=dev-python/pyee-13[${PYTHON_USEDEP}]
	<dev-python/pyee-14[${PYTHON_USEDEP}]
	net-libs/nodejs
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

src_prepare() {
	distutils-r1_src_prepare

	[[ $(<DRIVER_VERSION) == "${PW_CORE_PV}" ]] ||
		die "DRIVER_VERSION is $(<DRIVER_VERSION), update PW_CORE_PV"

	# upstream's bdist_wheel hook downloads node + playwright-core; the
	# driver is installed from SRC_URI and system nodejs instead
	echo 'from setuptools import setup; setup()' > setup.py || die

	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
}

src_install() {
	distutils-r1_src_install

	insinto /usr/share/playwright-driver
	doins -r "${WORKDIR}"/package
	dosym -r /usr/bin/node /usr/share/playwright-driver/node
}

python_install() {
	distutils-r1_python_install
	dosym -r /usr/share/playwright-driver "$(python_get_sitedir)"/playwright/driver
}
