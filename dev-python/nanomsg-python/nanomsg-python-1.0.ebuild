# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python2_7 python3_8 )
inherit distutils-r1

DESCRIPTION="nanomsg wrapper for python with multiple backends"
HOMEPAGE="https://github.com/tonysimpson/nanomsg-python"
SRC_URI="https://github.com/tonysimpson/nanomsg-python/archive/1.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
