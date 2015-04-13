# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

MY_P="${P/mp4i/MP4I}"
DESCRIPTION="A pure Ruby library for reading MP4 tags"
HOMEPAGE="http://rubyforge.org/projects/mp4info/"
SRC_URI="http://gems.rubyforge.org/gems/${MY_P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

IUSE=""
USE_RUBY="ruby18"
DEPEND="virtual/ruby"

S="${WORKDIR}/${MY_P}"
