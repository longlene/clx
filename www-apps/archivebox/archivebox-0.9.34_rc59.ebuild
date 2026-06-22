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
KEYWORDS="~amd64"
IUSE="debug ldap"
RESTRICT="test"

RDEPEND="
	app-admin/supervisor
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/django-6.0[${PYTHON_USEDEP}]
		>=dev-python/daphne-4.2.1[${PYTHON_USEDEP}]
		>=dev-python/django-ninja-1.5.1[${PYTHON_USEDEP}]
		>=dev-python/django-extensions-3.2.3[${PYTHON_USEDEP}]
		>=dev-python/django-signal-webhooks-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/django-admin-data-views-0.4.1[${PYTHON_USEDEP}]
		>=dev-python/django-object-actions-4.3.0[${PYTHON_USEDEP}]
		dev-python/django-taggit[${PYTHON_USEDEP}]
		>=dev-python/python-statemachine-2.3.6[${PYTHON_USEDEP}]
		>=dev-python/click-8.3.1[${PYTHON_USEDEP}]
		>=dev-python/rich-14.2.0[${PYTHON_USEDEP}]
		dev-python/rich-click[${PYTHON_USEDEP}]
		>=dev-python/ipython-8.27.0[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/platformdirs-4.3.6[${PYTHON_USEDEP}]
		>=dev-python/py-machineid-0.6.0[${PYTHON_USEDEP}]
		dev-python/atomicwrites[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
		>=dev-python/base32-crockford-0.3.0[${PYTHON_USEDEP}]
		>=dev-python/django-stubs-5.0.4[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
		>=dev-python/sonic-client-1.0.0[${PYTHON_USEDEP}]
		dev-python/dateparser[${PYTHON_USEDEP}]
		>=dev-python/croniter-6.0.0[${PYTHON_USEDEP}]
		dev-python/tzdata[${PYTHON_USEDEP}]
		>=dev-python/w3lib-2.2.1[${PYTHON_USEDEP}]
		>=dev-python/abxbus-2.5.10[${PYTHON_USEDEP}]
		>=dev-python/abxpkg-1.11.175[${PYTHON_USEDEP}]
		>=dev-python/abx-plugins-1.11.179[${PYTHON_USEDEP}]
		>=dev-python/abx-dl-1.11.179[${PYTHON_USEDEP}]
		ldap? (
			>=dev-python/python-ldap-3.4.3[${PYTHON_USEDEP}]
			>=dev-python/django-auth-ldap-4.1.0[${PYTHON_USEDEP}]
		)
		debug? (
			>=dev-python/django-debug-toolbar-4.4.6[${PYTHON_USEDEP}]
		)
	')
	$(python_gen_cond_dep '
		>=dev-python/uuid7-0.1.0[${PYTHON_USEDEP}]
	' python3_13)
"
