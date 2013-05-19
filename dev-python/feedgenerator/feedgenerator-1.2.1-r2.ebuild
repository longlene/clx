# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Standalone version of django.utils.feedgenerator"
HOMEPAGE="http://hg.lolnet.org/feedgenerator"
SRC_URI="mirror://pypi/f/feedgenerator/${P}.tar.gz"

LICENSE="BSD License"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

