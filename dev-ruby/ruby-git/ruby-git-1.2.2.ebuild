# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

USE_RUBY="ruby18"
EAPI="2"
inherit gems

DESCRIPTION="Git Library for Ruby"
HOMEPAGE="http://github.com/schacon/ruby-git/"
SRC_URI="http://gems.rubyforge.org/gems/git-${PV}.gem -> ruby-git-${PV}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

RDEPEND="dev-util/git"
DEPEND="${RDEPEND}"


