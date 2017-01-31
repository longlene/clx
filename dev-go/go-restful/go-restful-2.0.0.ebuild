# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/emicklei/go-restful"

DESCRIPTION="package for building REST-style Web Services using Google Go"
HOMEPAGE="https://github.com/emicklei/go-restful"
SRC_URI="https://github.com/emicklei/go-restful/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
