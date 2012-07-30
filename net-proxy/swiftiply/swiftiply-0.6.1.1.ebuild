# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

DESCRIPTION="Swiftiply is a clustering proxy server for web applications."
HOMEPAGE="http://swiftiply.swiftcore.org/"
SRC_URI="http://swiftiply.swiftcore.org/files/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

USE_RUBY="any"
DEPEND=">=dev-ruby/eventmachine-0.9.0"
