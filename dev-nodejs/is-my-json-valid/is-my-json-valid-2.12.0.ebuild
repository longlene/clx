# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="A JSONSchema validator that uses code generation to be extremely fast"
HOMEPAGE="https://github.com/mafintosh/is-my-json-valid"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xtend
dev-nodejs/jsonpointer
dev-nodejs/generate-object-property
dev-nodejs/generate-function
"
