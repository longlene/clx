# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f6d54c89a85033797cd41864e77c85b6f541caa9"

DESCRIPTION="Simpler record specification"
HOMEPAGE="https://github.com/williamyaoh/defrecord"
SRC_URI="https://github.com/williamyaoh/defrecord/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
