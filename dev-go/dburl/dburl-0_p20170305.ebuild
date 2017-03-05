# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/knq/dburl"
EGIT_COMMIT="9703c47ca29652602ba6998d1286836f4cfca8df"

DESCRIPTION="Package dburl provides a standard, URL style mechanism for parsing and opening SQL database connection strings"
HOMEPAGE="https://github.com/knq/dburl"
SRC_URI="https://github.com/knq/dburl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
