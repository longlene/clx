# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Collection of common cryptography functions"
HOMEPAGE="http://shinmera.github.io/crypto-shortcuts/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Shinmera/crypto-shortcuts.git"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-base64
	dev-lisp/ironclad
	dev-lisp/flexi-streams
"
