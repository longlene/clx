# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems

DESCRIPTION="Documatic is an OpenDocument extension for Ruport"
HOMEPAGE="http://stonecode.svnrepository.com/documatic"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-ruby/ruport-1.4.0
        >=dev-ruby/rubyzip-0.9.1
        >=dev-ruby/gem_plugin-0.2.2"
