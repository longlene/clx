# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0f2887b89b295a5a35b4f55b6b954c2d464e796b"

DESCRIPTION="Makes read macros more Lispy"
HOMEPAGE="https://github.com/williamyaoh/named-read-macros"
SRC_URI="https://github.com/williamyaoh/named-read-macros/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
"
