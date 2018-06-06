# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="An implementation of the Language Server Protocol for Python"
HOMEPAGE="https://github.com/palantir/python-language-server"
SRC_URI="https://github.com/palantir/python-language-server/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/configparser
	dev-python/jedi
	dev-python/pluggy
"

python_
