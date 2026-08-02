# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
COMMIT="1bd8dd9510d309dceef842e1aed7aaf6c1b68ff9"

inherit distutils-r1

DESCRIPTION="A user-friendly JSON editing form field for Django admin"
HOMEPAGE="https://github.com/alphatownsman/django-jsonform"
SRC_URI="https://github.com/alphatownsman/django-jsonform/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/django-jsonform-${COMMIT}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"

RESTRICT="test"
