# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit python-r1

MY_WHL="${PN}-${PV}-py3-none-any.whl"

DESCRIPTION="NVIDIA GPU Cloud SDK"
HOMEPAGE="https://ngc.nvidia.com/"
SRC_URI="https://files.pythonhosted.org/packages/af/53/501ca12b467a988c5544215ec300b68e6e7e473832d287ad001913a6d85a/${MY_WHL}"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="telemetry"
RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/aiofiles-23.2.1[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.10.11[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.20.5[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.37[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.7.4[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
	>=dev-python/docker-6[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6[${PYTHON_USEDEP}]
	>=dev-python/packaging-24[${PYTHON_USEDEP}]
	>=dev-python/polling2-0.5[${PYTHON_USEDEP}]
	>=dev-python/prettytable-3.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.8[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/rich-12.6[${PYTHON_USEDEP}]
	>=dev-python/shortuuid-1.0.11[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26[${PYTHON_USEDEP}]
	>=dev-python/validators-0.21[${PYTHON_USEDEP}]
	telemetry? (
		>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.20[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-instrumentation-0.41_beta0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.20[${PYTHON_USEDEP}]
	)
"

src_unpack() {
	:
}

src_install() {
	python_foreach_impl python_install_impl
}

python_install_impl() {
	"${EPYTHON}" -m gpep517 install-wheel \
		--destdir="${D}" \
		--prefix=/usr \
		--interpreter="/usr/bin/${EPYTHON}" \
		--optimize=all \
		"${DISTDIR}/${MY_WHL}" || die
}
