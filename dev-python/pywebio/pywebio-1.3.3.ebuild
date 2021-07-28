# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
inherit distutils-r1

DESCRIPTION="Write interactive web app in script way"
HOMEPAGE="https://github.com/wang0618/PyWebIO"
SRC_URI="https://github.com/wang0618/PyWebIO/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/tornado
	dev-python/user-agents
	dev-python/flask
	dev-python/django
	dev-python/aiohttp
	dev-python/starlette
	dev-python/uvicorn
	dev-python/aiofiles
	dev-python/boken
	dev-python/pandas
	dev-python/cutecharts
	dev-python/pyecharts
	dev-python/plotly
	dev-python/pillow
"
BDEPEND=""
