# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="The Modern And Developer Centric Python Web Framework"
HOMEPAGE="https://docs.masoniteproject.com/ https://github.com/MasoniteFramework/masonite"
SRC_URI="https://github.com/MasoniteFramework/masonite/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/masonite-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

# Many dependencies have narrow upper-bound pins that may conflict with
# current portage versions. The following are also not yet packaged:
#   dev-python/exceptionite   (exception handler framework)
#   dev-python/pendulum       (requires <3.0, pendulum 3.x has breaking API)
#   dev-python/hupper         (file watcher for dev server)
#   dev-python/masonite-orm   (Masonite's own ORM layer)
#   dev-python/hfilesize      (human-readable file sizes)
#   dev-python/dotty-dict     (dot-notation dict access)

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/bcrypt-3.2[${PYTHON_USEDEP}]
		>=dev-python/cryptography-36[${PYTHON_USEDEP}]
		>=dev-python/hashids-1.3[${PYTHON_USEDEP}]
		>=dev-python/inflection-0.3[${PYTHON_USEDEP}]
		<dev-python/jinja2-3.2[${PYTHON_USEDEP}]
		>=dev-python/phonenumbers-8.12[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.4[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-0.15[${PYTHON_USEDEP}]
		>=dev-python/tldextract-2.2[${PYTHON_USEDEP}]
		>=dev-python/watchdog-2[${PYTHON_USEDEP}]
		>=dev-python/werkzeug-3[${PYTHON_USEDEP}]
		>=dev-python/whitenoise-5.2[${PYTHON_USEDEP}]
	')
"
