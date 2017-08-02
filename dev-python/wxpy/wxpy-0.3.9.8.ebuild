# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="wxpy: 用 Python 玩微信"
HOMEPAGE="https://github.com/youfou/wxpy"
SRC_URI="https://github.com/youfou/wxpy/archive/0.3.9.8.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/itchat
	dev-python/requests
	dev-python/future
"

src_prepare() {
	eapply_user
	rm -r tests
}
