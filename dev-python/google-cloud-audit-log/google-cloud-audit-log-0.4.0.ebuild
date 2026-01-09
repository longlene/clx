# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Google Cloud Audit Protos"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/$PN"
SRC_URI="https://github.com/googleapis/google-cloud-python/archive/refs/tags/${PN}-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.56.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/google-cloud-python-${PN}-v${PV}/packages/${PN}
