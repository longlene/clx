# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c6c0ae40749ea49958f9c25b2b0be7a4ef523e95"

DESCRIPTION="A JPEG library for Common Lisp"
HOMEPAGE="http://www.cliki.net/cl-jpeg"
SRC_URI="https://github.com/sharplispers/cl-jpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""
