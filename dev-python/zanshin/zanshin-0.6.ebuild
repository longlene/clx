# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="High-level library for HTTP, WebDAV and CalDAV operations"
HOMEPAGE="http://chandlerproject.org/Projects/ZanshinProject"
# FIXME Remove some of these comments when everything works all peachy
# FIXME: work with upstream to release snapshots of only Zanshin so that the
# entire chandler snapshot doesn't need to be downloaded.
# Note that this is a snapshot of the chandler 1.0.2 source which includes
# zanshin version 171
#SRC_URI="http://downloads.osafoundation.org/chandler/releases/1.0.2/Chandler_src_1.0.2.tar.gz"
# Note that version 0.6 = svn 177
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

#S=${WORKDIR}/chandler-1.0.2/external/${PN}/${PN}-171

