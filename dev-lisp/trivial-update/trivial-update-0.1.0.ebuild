# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Easy modification of places with any given function"
HOMEPAGE="https://github.com/mrkkrp/trivial-update/"
SRC_URI="mirror://github/mrkkrp/trivial-update/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
