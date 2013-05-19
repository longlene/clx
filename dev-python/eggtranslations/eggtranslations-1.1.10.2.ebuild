# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Provides an API for accessing localizations and resources
packaged in eggs"
HOMEPAGE="http://chandlerproject.org/Projects/EggTranslations"
# FIXME: work with upstream to release snapshots of only eggtranslations so that
# the entire chandler release doesn't need to be downloaded.
# Note that this is a snapshot of the chandler 1.0.2 source which includes
# eggtranslations version 1.1-r10-2
SRC_URI="http://downloads.osafoundation.org/chandler/releases/1.0.2/Chandler_src_1.0.2.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/chandler-1.0.2/external/eggtranslations/eggtranslations-1.1-r10-2"

