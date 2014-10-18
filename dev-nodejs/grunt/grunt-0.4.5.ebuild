# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit npm

DESCRIPTION="The JavaScript Task Runner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=""
RDEPEND=">=dev-nodejs/async-0.1.22
	>=dev-nodejs/coffee-script-1.3.3 
	>=dev-nodejs/colors-0.6.0 
	>=dev-nodejs/dateformat-1.0.2 
	>=dev-nodejs/eventemitter2-0.4.9
	>=dev-nodejs/findup-sync-0.1.0
	>=dev-nodejs/glob-3.1.21
	>=dev-nodejs/hooker-0.2.3
	>=dev-nodejs/iconv-lite-0.2.5
	>=dev-nodejs/minimatch-0.2.6
	>=dev-nodejs/nopt-1.0.10 
	>=dev-nodejs/rimraf-2.0.2 
	>=dev-nodejs/lodash-0.9.0 
	>=dev-nodejs/underscore_string-2.2
	>=dev-nodejs/which-1.0.5
	>=dev-nodejs/js-yaml-2.0.2
	>=net-libs/nodejs-0.8.10
	${DEPEND}"

NPM_EXTRA_FILES="custom-gruntfile.js Gruntfile.js"

src_install() {
	npm_src_install

	if use doc; then
		dodoc -r docs
	fi
}
