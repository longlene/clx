# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/blevesearch/segment"
EGIT_COMMIT="762005e7a34fd909a84586299f1dd457371d36ee"

DESCRIPTION="A Go library for performing Unicode Text Segmentation as described in Unicode Standard Annex #29"
HOMEPAGE="https://github.com/blevesearch/segment"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
