# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="OpenID Connect extension for Flask"
HOMEPAGE="https://github.com/fedora-infra/flask-oidc https://pypi.org/project/flask-oidc/"

S="${WORKDIR}/flask_oidc-${PV}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/authlib-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/blinker-1.4.0[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	')
"
