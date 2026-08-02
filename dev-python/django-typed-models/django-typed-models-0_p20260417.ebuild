# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )
COMMIT="e4a42fbf9972abeade556243c13f2c03c5dad367"

inherit distutils-r1

DESCRIPTION="Polymorphic Django models using automatic type-field downcasting"
HOMEPAGE="https://github.com/alphatownsman/django-typed-models"
SRC_URI="https://github.com/alphatownsman/django-typed-models/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/django-typed-models-${COMMIT}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/django[${PYTHON_USEDEP}]
	dev-python/django-stubs-ext[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"

RESTRICT="test"
