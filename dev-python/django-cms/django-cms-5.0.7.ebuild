# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Lean enterprise content management powered by Django"
HOMEPAGE="https://www.django-cms.org/ https://github.com/django-cms/django-cms"
SRC_URI="https://github.com/django-cms/django-cms/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="argon2 bcrypt"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/django-4.2[${PYTHON_USEDEP}]
	>=dev-python/packaging-0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-0[${PYTHON_USEDEP}]
	dev-python/django-classy-tags[${PYTHON_USEDEP}]
	dev-python/django-formtools[${PYTHON_USEDEP}]
	dev-python/django-treebeard[${PYTHON_USEDEP}]
	dev-python/django-sekizai[${PYTHON_USEDEP}]
	dev-python/djangocms-admin-style[${PYTHON_USEDEP}]
	argon2? ( >=dev-python/argon2-cffi-19.1.0[${PYTHON_USEDEP}] )
	bcrypt? ( dev-python/bcrypt[${PYTHON_USEDEP}] )
')"
