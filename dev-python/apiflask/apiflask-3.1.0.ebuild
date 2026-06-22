# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A lightweight Python web API framework"
HOMEPAGE="
	https://apiflask.com/
	https://github.com/apiflask/apiflask
	https://pypi.org/project/apiflask/
"
SRC_URI="https://github.com/apiflask/apiflask/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="async dotenv yaml"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/apispec-6.0.0[${PYTHON_USEDEP}]
		dev-python/email-validator[${PYTHON_USEDEP}]
		>=dev-python/flask-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/flask-httpauth-4.8.0[${PYTHON_USEDEP}]
		>=dev-python/flask-marshmallow-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/marshmallow-3.20[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
		>=dev-python/webargs-8.3[${PYTHON_USEDEP}]
		async? ( >=dev-python/asgiref-3.2[${PYTHON_USEDEP}] )
		dotenv? ( dev-python/python-dotenv[${PYTHON_USEDEP}] )
		yaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
	')
"
