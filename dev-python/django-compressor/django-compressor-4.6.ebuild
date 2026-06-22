# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Compresses linked and inline JavaScript or CSS into single cached files"
HOMEPAGE="https://django-compressor.readthedocs.io/ https://github.com/django-compressor/django-compressor"
SRC_URI="https://github.com/django-compressor/django-compressor/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Missing deps not yet in portage:
#   dev-python/django-appconf   (app-level Django settings helper)
#   dev-python/rcssmin          (CSS minifier)
#   dev-python/rjsmin           (JS minifier)

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/django-4.2[${PYTHON_USEDEP}]
		>=dev-python/django-appconf-1.0.3[${PYTHON_USEDEP}]
		>=dev-python/rcssmin-1.2.1[${PYTHON_USEDEP}]
		>=dev-python/rjsmin-1.2.4[${PYTHON_USEDEP}]
	')
"
