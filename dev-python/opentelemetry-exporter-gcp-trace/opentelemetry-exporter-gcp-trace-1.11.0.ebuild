# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PN="opentelemetry-operations-python"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Google Cloud Trace exporter for OpenTelemetry"
HOMEPAGE="
	https://pypi.org/project/opentelemetry-exporter-gcp-trace/
	https://github.com/GoogleCloudPlatform/opentelemetry-operations-python
"
SRC_URI="https://github.com/GoogleCloudPlatform/opentelemetry-operations-python/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-cloud-trace-1.1[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.30.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.30.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-resourcedetector-gcp-1.5.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${MY_P}/${PN}
