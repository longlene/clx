# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A full-featured toolkit and server for text-based multiplayer games"
HOMEPAGE="https://github.com/evennia/evennia"
SRC_URI="https://github.com/evennia/evennia/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
  	>=dev-python/django-4.2[${PYTHON_USEDEP}]
  	>=dev-python/twisted-23.10[${PYTHON_USEDEP}]
  	>=dev-python/pytz-2022.6[${PYTHON_USEDEP}]
  	>=dev-python/djangorestframework-3.14[${PYTHON_USEDEP}]
  	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
  	>=dev-python/django-filter-2.4[${PYTHON_USEDEP}]
  	>=dev-python/django-sekizai-2.0.0[${PYTHON_USEDEP}]
  	>=dev-python/inflect-5.2.0[${PYTHON_USEDEP}]
  	>=dev-python/autobahn-20.7.1[${PYTHON_USEDEP}]
  	>=dev-python/lunr-0.7.0[${PYTHON_USEDEP}]
  	>=dev-python/simpleeval-1.0[${PYTHON_USEDEP}]
  	>=dev-python/uritemplate-4.1.1[${PYTHON_USEDEP}]
  	>=dev-python/tzdata-2022.6[${PYTHON_USEDEP}]

  	>=dev-python/mock-4.0.3[${PYTHON_USEDEP}]
  	>=dev-python/model_mommy-2.0[${PYTHON_USEDEP}]
  	>=dev-python/anything-0.2.1[${PYTHON_USEDEP}]
  	>=dev-python/black-22.6[${PYTHON_USEDEP}]
  	>=dev-python/isort-5.10[${PYTHON_USEDEP}]
  	>=dev-python/parameterized-0.9.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
