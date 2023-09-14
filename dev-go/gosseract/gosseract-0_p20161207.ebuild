# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/otiai10/gosseract"
EGIT_COMMIT="5e15d71c88a605e6bb3b84f53cc628a66f3b6500"

DESCRIPTION="Golang OCR library, wrapping Tesseract-ocr"
HOMEPAGE="https://github.com/otiai10/gosseract"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	app-text/tesseract
"
RDEPEND="${DEPEND}"
