# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/technoweenie/multipartstreamer"

DESCRIPTION="Package multipartstreamer helps you encode large files in MIME multipart format without reading the entire content into memory"
HOMEPAGE="https://github.com/technoweenie/multipartstreamer"
SRC_URI="https://github.com/technoweenie/multipartstreamer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
