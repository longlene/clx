# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Generative Programming and KBE system embedded in Common Lisp"
HOMEPAGE="http://gendl.com/"
SRC_URI=""

EGIT_REPO_URI="https://gitlab.common-lisp.net/gendl/gendl.git"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	rm "surf/source/box-intersection .lisp" "documentation/training/g102-tud/images/KBE practical slides v2.png"
}
