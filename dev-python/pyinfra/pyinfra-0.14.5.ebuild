# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="pyinfra automates infrastructure super fast at massive scale"
HOMEPAGE="https://pyinfra.com/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/gevent
	dev-python/paramiko
	dev-python/click
	dev-python/colorama
	dev-python/docopt
	dev-python/jinja2
	dev-python/python-dateutil
	dev-python/six
	dev-python/configparser
	dev-python/pyyaml
"
BDEPEND=""
