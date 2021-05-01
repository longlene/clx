# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3

DESCRIPTION="A socket-level interface to the PostgreSQL server"
HOMEPAGE="http://emarsden.chez.com/downloads/"
SRC_URI="http://emarsden.chez.com/downloads/pg-dot-lisp-${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
