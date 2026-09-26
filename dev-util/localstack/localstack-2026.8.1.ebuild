# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="CLI to start and manage LocalStack, a local AWS cloud emulator, in Docker"
HOMEPAGE="
	https://localstack.cloud
	https://pypi.org/project/localstack/
"
# upstream only publishes a wheel for the CLI
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/asn1crypto[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.2.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/dnslib-0.9.10[${PYTHON_USEDEP}]
	>=dev-python/dnspython-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/docker-6.1.1[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	>=dev-python/plux-1.16.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.4.8[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/pyotp-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.19.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/rich-12.3.0[${PYTHON_USEDEP}]
	>=dev-python/semver-2.10[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
"

src_unpack() {
	:
}

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/${P}-py3-none-any.whl"
}

pkg_postinst() {
	elog "'localstack start' runs the LocalStack Docker image, so a running"
	elog "Docker (or compatible) daemon is required."
}
