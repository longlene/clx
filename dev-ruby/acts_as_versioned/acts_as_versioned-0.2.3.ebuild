# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="This library adds simple versioning to an ActiveRecord module."
HOMEPAGE="http://rubyforge.org/projects/ar-versioned"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND} dev-ruby/activerecord"
