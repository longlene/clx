# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="The Pyramid Web Framework, a Pylons project"
HOMEPAGE="https://trypyramid.com/ https://github.com/Pylons/pyramid"
SRC_URI="https://github.com/Pylons/pyramid/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

# Main code: BSD-4 clause (Repoze variant)
# ZPL portions within source files: ZPL
# i18n (Edgewall): BSD
# Paste portions: MIT
LICENSE="BSD-4 BSD MIT ZPL"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Missing deps not yet in portage:
#   dev-python/hupper         (file-change monitor for server reload)
#   dev-python/plaster        (config loader interface)
#   dev-python/plaster-pastedeploy
#   dev-python/translationstring
#   dev-python/venusian       (object annotation library)

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/webob-1.8.3[${PYTHON_USEDEP}]
		>=dev-python/zope-deprecation-3.5.0[${PYTHON_USEDEP}]
		>=dev-python/zope-interface-3.8.0[${PYTHON_USEDEP}]
	')
"
