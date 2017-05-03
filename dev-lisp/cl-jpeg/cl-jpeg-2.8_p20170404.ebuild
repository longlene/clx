# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="319a8f347e4bc590e0ad9e66624dedbf324bcf98"

DESCRIPTION="A JPEG library for Common Lisp"
HOMEPAGE="http://www.cliki.net/cl-jpeg"
SRC_URI="https://github.com/sharplispers/cl-jpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
