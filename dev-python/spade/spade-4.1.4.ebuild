# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Smart Python Agent Development Environment"
HOMEPAGE="https://spadeagents.eu https://github.com/javipalanca/spade"
SRC_URI="https://github.com/javipalanca/spade/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# slixmpp-multiplatform (a multiplatform fork of slixmpp) is not yet packaged
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/aiohttp-3.10.4[${PYTHON_USEDEP}]
		dev-python/aiohttp-jinja2[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.6[${PYTHON_USEDEP}]
		dev-python/jinja2-time[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pyjabber-0.4.3[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
		dev-python/singletonify[${PYTHON_USEDEP}]
		dev-python/timeago[${PYTHON_USEDEP}]
		>=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
	')
"
