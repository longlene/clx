# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

MY_PV="${PV/_rc/rc}"

DESCRIPTION="Self-hosted internet archiving solution"
HOMEPAGE="https://archivebox.io https://github.com/ArchiveBox/ArchiveBox"
SRC_URI="https://github.com/ArchiveBox/ArchiveBox/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/ArchiveBox-${MY_PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="debug ldap"
RESTRICT="test"

RDEPEND="
	>=app-admin/supervisor-4.2.5
	>=dev-python/setuptools-74.1.0[${PYTHON_USEDEP}]
	>=dev-python/django-6.1[${PYTHON_USEDEP}]
	>=dev-python/psycopg-3.2[${PYTHON_USEDEP}]
	>=dev-python/daphne-4.2.1[${PYTHON_USEDEP}]
	>=dev-python/django-ninja-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/django-extensions-3.2.3[${PYTHON_USEDEP}]
	>=dev-python/django-signal-webhooks-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/django-admin-data-views-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/django-object-actions-4.3.0[${PYTHON_USEDEP}]
	>=dev-python/bleach-6.2.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.3.1[${PYTHON_USEDEP}]
	>=dev-python/rich-14.2.0[${PYTHON_USEDEP}]
	>=dev-python/rich-click-1.9.5[${PYTHON_USEDEP}]
	>=dev-python/ipython-8.27.0[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
	>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}]
	>=dev-python/py-machineid-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/atomicwrites-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
	>=dev-python/base32-crockford-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/django-stubs-5.0.4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/sonic-client-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2024.2[${PYTHON_USEDEP}]
	>=dev-python/w3lib-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/abxbus-2.5.65[${PYTHON_USEDEP}]
	>=dev-python/abxpkg-1.13.10[${PYTHON_USEDEP}]
	>=dev-python/abx-plugins-1.13.34[${PYTHON_USEDEP}]
	>=dev-python/abx-dl-1.13.28[${PYTHON_USEDEP}]
	>=dev-python/browser-cookie3-0.20.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
	' python3_13)
	ldap? (
		>=dev-python/python-ldap-3.4.3[${PYTHON_USEDEP}]
		>=dev-python/django-auth-ldap-4.1.0[${PYTHON_USEDEP}]
	)
	debug? (
		>=dev-python/django-debug-toolbar-4.4.6[${PYTHON_USEDEP}]
		>=dev-python/djdt-flamegraph-0.2.13[${PYTHON_USEDEP}]
		>=dev-python/ipdb-0.13.13[${PYTHON_USEDEP}]
		>=dev-python/requests-tracker-0.3.3[${PYTHON_USEDEP}]
		>=dev-python/django-autotyping-0.5.1[${PYTHON_USEDEP}]
	)
"
