# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d814f32e0245c8fae4a5bd5ec13c93905ebd06d5"

DESCRIPTION="Common Lisp interface to TIDY, a program that cleans up messy HTML"
HOMEPAGE="https://github.com/gonzojive/cl-tidy"
SRC_URI="https://github.com/gonzojive/cl-tidy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	app-text/htmltidy
"
