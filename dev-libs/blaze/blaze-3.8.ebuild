# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A high performance C++ math library"
HOMEPAGE="https://bitbucket.org/blaze-lib/blaze/src/master/"
SRC_URI="https://bitbucket.org/blaze-lib/blaze/downloads/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
