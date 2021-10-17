# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )
inherit distutils-r1

DESCRIPTION="Every web site provides APIs"
HOMEPAGE="http://www.toapi.org/"
SRC_URI="https://github.com/gaojiuli/toapi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lxml
	dev-lisp/flask
	dev-lisp/selenium
	dev-lisp/requests
	dev-lisp/records
	dev-lisp/cssselect
	dev-lisp/ujson
	dev-lisp/redis
	dev-lisp/pymemcache
	dev-lisp/pycrypto
	dev-lisp/colorama
"
