# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_7 )
inherit distutils-r1

DESCRIPTION="the first third-party instant messaging client for Google Hangouts"
HOMEPAGE="https://github.com/tdryer/hangups"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/configargparse
	dev-python/aiohttp
	dev-python/async-timeout
	dev-python/appdirs
	dev-python/readlike
	dev-python/requests
	dev-python/ReParser
	dev-python/protobuf-python
	dev-python/urwid
	dev-python/MechanicalSoup
"
BDEPEND=""
