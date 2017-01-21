# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e31bfb08db4d4c9cadfa7f1bdbc01a8c035e684d"

DESCRIPTION="Readline-style line-editor for Common Lisp"
HOMEPAGE="https://github.com/nikodemus/linedit"
SRC_URI="https://github.com/nikodemus/linedit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uffi
	dev-lisp/osicat
	dev-lisp/alexandria
"
