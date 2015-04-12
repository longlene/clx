# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit common-lisp-3 git-2

DESCRIPTION="A collection of public domain utilities."
HOMEPAGE="http://common-lisp.net/project/alexandria/"
EGIT_REPO_URI="git://common-lisp.net/projects/alexandria/alexandria.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

src_prepare() {
	sed -i 's/(:static-file.*LICENCE.*)//' alexandria.asd
}
