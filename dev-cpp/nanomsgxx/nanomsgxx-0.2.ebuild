# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )
PYTHON_REQ_USE='threads(+)'
inherit python-any-r1 waf-utils

DESCRIPTION="Nanomsg binding for C++11"
HOMEPAGE="https://github.com/achille-roussel/nanomsgxx"
SRC_URI="https://github.com/achille-roussel/nanomsgxx/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/nanomsg"
RDEPEND="${DEPEND}"

NO_WAF_LIBDIR="NO"
