# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="SASS processor to compile SCSS files into *.css, while rendering, or offline"
HOMEPAGE="https://github.com/jrief/django-sass-processor"
SRC_URI="https://github.com/jrief/django-sass-processor/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"

RESTRICT="test"
