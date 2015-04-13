# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

USE_RUBY="ruby18"
DESCRIPTION="This library adds simple versioning to an ActiveRecord module."
HOMEPAGE="http://rubyforge.org/projects/ar-versioned"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~arm"
IUSE=""

DEPEND="virtual/ruby"
RDEPEND="${DEPEND} dev-ruby/activerecord"
