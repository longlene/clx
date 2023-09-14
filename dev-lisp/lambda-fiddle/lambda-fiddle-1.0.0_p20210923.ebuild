# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b07e213bed6c8ffab56218c5c6a207cea33960b"

DESCRIPTION="A collection of utilities to process lambda-lists"
HOMEPAGE="http://shinmera.github.io/lambda-fiddle"
SRC_URI="http://github.com/Shinmera/lambda-fiddle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
