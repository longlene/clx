# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gems

USE_RUBY="ruby18"

DESCRIPTION="Simple, straight-forward base for web-frameworks."
HOMEPAGE="http://github.com/manveru/innate"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"


RDEPEND=">=dev-ruby/rack-1.0.0"
DEPEND="${RDEPEND}"

