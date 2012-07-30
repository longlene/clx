# Copyright 2011 Christopher J. Madsen
#
# Distributed under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# $Id$

EAPI=4

DESCRIPTION="Create or verify SFV or MD5 checksum files"
HOMEPAGE="http://www.cjmweb.net/ffv/"
SRC_URI="http://www.cjmweb.net/ffv/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="test"
DEPEND="test? ( dev-lang/perl )"
RDEPEND=""
