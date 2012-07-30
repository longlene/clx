# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby gems

DESCRIPTION="A pure Ruby library for reading metadata from Flac files"
HOMEPAGE="http://badcomputer.org/unix/code/flacinfo/"
SRC_URI="http://gems.rubyforge.org/gems/${P}.gem"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
USE_RUBY="ruby18"
DEPEND="virtual/ruby"
