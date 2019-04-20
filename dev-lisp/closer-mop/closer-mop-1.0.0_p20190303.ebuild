# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="659d18ec4f0965c79ac12a870013fca15ee1f498"

DESCRIPTION="Closer to MOP is a Common Lisp Metaobject Protocol compatibility layer."
HOMEPAGE="http://common-lisp.net/project/closer/closer-mop.html"
SRC_URI="https://github.com/pcostanza/closer-mop/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

