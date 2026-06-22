# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Add webhooks to django using signals"
HOMEPAGE="https://github.com/MrThearMan/django-signal-webhooks https://pypi.org/project/django-signal-webhooks/"

S="${WORKDIR}/django_signal_webhooks-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="drf"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
	>=dev-python/django-settings-holder-0.2.1[${PYTHON_USEDEP}]
	drf? ( >=dev-python/djangorestframework-3.14.0[${PYTHON_USEDEP}] )
')"
