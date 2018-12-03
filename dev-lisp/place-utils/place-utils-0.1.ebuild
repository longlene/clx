# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="a Common Lisp library that provides a few utilities relating to setfable places"
HOMEPAGE="https://github.com/Hexstream/place-utils"
SRC_URI="https://github.com/Hexstream/place-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
