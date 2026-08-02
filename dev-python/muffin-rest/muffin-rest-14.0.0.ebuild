# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="REST helpers for Muffin framework — ASGI REST API support"
HOMEPAGE="https://github.com/klen/muffin-rest"
SRC_URI="https://github.com/klen/muffin-rest/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="peewee sqlalchemy yaml"
RESTRICT="test"

RDEPEND="
	>=dev-python/apispec-6[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3[${PYTHON_USEDEP}]
	dev-python/muffin[${PYTHON_USEDEP}]
	peewee? (
		dev-python/muffin-peewee-aio[${PYTHON_USEDEP}]
		dev-python/marshmallow-peewee[${PYTHON_USEDEP}]
	)
	sqlalchemy? (
		dev-python/muffin-databases[${PYTHON_USEDEP}]
		dev-python/marshmallow-sqlalchemy[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	)
	yaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/uv-build-0.9.7[${PYTHON_USEDEP}]
"
