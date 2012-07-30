# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/irman-python/irman-python-0.1.ebuild,v 1.15 2005/10/02 14:10:17 agriffis Exp $

inherit distutils

IUSE=""
DESCRIPTION="A pickeling/unpickeling library for numpy/numeric arrays to netcdf"
HOMEPAGE="http://geosci.uchicago.edu/~cdieterich/python/ncPickle/"
SRC_URI="http://geosci.uchicago.edu/~cdieterich/python/ncPickle/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 sparc x86"

DEPEND="virtual/python \
	|| (dev-python/numeric dev-python/numpy) \
	dev-lang/swig \
	sci-libs/netcdf"

RDEPEND="virtual/python \
	|| (dev-python/numeric dev-python/numpy) \
	sci-libs/netcdf"