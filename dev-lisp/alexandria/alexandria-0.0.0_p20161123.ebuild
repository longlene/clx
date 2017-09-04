# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="85f82ed88d5fa6e63026038dbb1dad0d6cd5dafe"

DESCRIPTION="A collection of public domain utilities."
HOMEPAGE="http://common-lisp.net/project/alexandria/"
SRC_URI="https://github.com/keithj/alexandria/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="doc"

src_prepare() {
	eapply_user
	sed -i 's/(:static-file.*LICENCE.*)//' alexandria.asd
}
