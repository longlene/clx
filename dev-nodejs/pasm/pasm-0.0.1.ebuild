# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit npm

DESCRIPTION="Piston Assembler"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-nodejs/uglify-js-1.0.0
>=dev-nodejs/jison-0.2.0
>=dev-nodejs/coffee-script-1.40
>=net-libs/nodejs-0.8.10
${DEPEND}"

#NPM_EXTRA_FILES="custom-gruntfile.js Gruntfile.js"

#src_install() {
#	npm_src_install
#
#	if use doc; then
#		dodoc -r docs
#	fi
#}
