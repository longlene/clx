# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Mypy stubs for Django"
HOMEPAGE="https://github.com/typeddjango/django-stubs https://pypi.org/project/django-stubs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mypy oracle redis"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/django-stubs-ext[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/types-pyyaml[${PYTHON_USEDEP}]
		mypy? ( dev-python/mypy[${PYTHON_USEDEP}] )
		oracle? ( dev-python/oracledb[${PYTHON_USEDEP}] )
		redis? (
			dev-python/redis[${PYTHON_USEDEP}]
			dev-python/types-redis[${PYTHON_USEDEP}]
		)
	')
"
