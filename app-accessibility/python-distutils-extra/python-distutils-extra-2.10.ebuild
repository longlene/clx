# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-distutils-extra/python-distutils-extra-1.92_pre67.ebuild,v 1.2 2009/07/14 22:52:51 mr_bones_ Exp $

EAPI="2"

inherit distutils

DESCRIPTION="You can integrate gettext support, themed icons and scrollkeeper based documentation in distutils."
HOMEPAGE="https://launchpad.net/python-distutils-extra"
#SRC_URI="http://dev.gentooexperimental.org/~zerox/${P}.tar.bz2"
#SRC_URI="http://launchpad.net/python-distutils-extra/trunk/${P}/+download/python-distutils-extra-${P}.tar.gz"
SRC_URI="http://launchpad.net/python-distutils-extra/trunk/2.10/+download/python-distutils-extra-2.10.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python"
RDEPEND="${DEPEND}"

DOCS="doc/FAQ doc/README  doc/setup.cfg.example  doc/setup.py.example"

#S=${WORKDIR}/${PN}
#S=${WORKDIR}/${PV}
S=${WORKDIR}/${P}
