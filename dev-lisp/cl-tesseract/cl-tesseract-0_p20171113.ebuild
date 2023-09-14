# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="24acb402890454a632c2f1f848dc72d33ed4770f"

DESCRIPTION="Common Lisp bindings for the Tesseract OCR library"
HOMEPAGE="https://github.com/GOFAI/cl-tesseract"
SRC_URI="https://github.com/GOFAI/cl-tesseract/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-text/tesseract
	dev-lisp/cffi
"
