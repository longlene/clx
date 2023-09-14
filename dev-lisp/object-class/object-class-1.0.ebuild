# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Ensures that special subclasses of standard-object cluster right in front of standard-object"
HOMEPAGE="https://github.com/Hexstream/object-class"
SRC_URI="https://github.com/Hexstream/object-class/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/compatible-metaclasses
	dev-lisp/enhanced-find-class
"
BDEPEND=""
