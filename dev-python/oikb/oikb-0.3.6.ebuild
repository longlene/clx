# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Sync anything to Open WebUI Knowledge Bases"
HOMEPAGE="https://github.com/open-webui/oikb"
SRC_URI="https://github.com/open-webui/oikb/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="azure dropbox gcs gdrive oracle s3 sharepoint web"
RESTRICT="test"

RDEPEND="
	>=dev-python/click-8.1[${PYTHON_USEDEP}]
	>=dev-python/croniter-2.0[${PYTHON_USEDEP}]
	>=dev-python/fastapi-0.115[${PYTHON_USEDEP}]
	>=dev-python/prometheus-client-0.20[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.30[${PYTHON_USEDEP}]
	>=dev-python/watchdog-4.0[${PYTHON_USEDEP}]
	azure? ( >=dev-python/azure-storage-blob-12.19[${PYTHON_USEDEP}] )
	dropbox? ( >=dev-python/dropbox-12.0[${PYTHON_USEDEP}] )
	gcs? ( >=dev-python/google-cloud-storage-2.14[${PYTHON_USEDEP}] )
	gdrive? (
		>=dev-python/google-api-python-client-2.100[${PYTHON_USEDEP}]
		>=dev-python/google-auth-2.25[${PYTHON_USEDEP}]
	)
	oracle? ( dev-python/oci[${PYTHON_USEDEP}] )
	s3? ( >=dev-python/boto3-1.34[${PYTHON_USEDEP}] )
	sharepoint? (
		>=dev-python/cryptography-42.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.8[${PYTHON_USEDEP}]
	)
	web? ( >=dev-python/beautifulsoup4-4.12[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/uv-build-0.8.0[${PYTHON_USEDEP}]
"
