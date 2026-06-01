# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="XMLRPC module for Guile"
HOMEPAGE="https://github.com/aconchillo/guile-xmlrpc"
SRC_URI="https://github.com/aconchillo/guile-xmlrpc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
