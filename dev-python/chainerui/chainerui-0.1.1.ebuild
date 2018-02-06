# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="User Interface for Chainer"
HOMEPAGE="https://github.com/chainer/chainerui"
SRC_URI="https://github.com/chainer/chainerui/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/flask
	dev-python/werkzeug
	dev-python/apscheduler
	dev-python/sqlalchemy
	dev-python/alembic
	dev-python/chainer
"
