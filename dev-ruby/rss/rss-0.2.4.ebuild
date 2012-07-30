# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit ruby

DESCRIPTION="A library to parse RSS with validation (or non validation)."
HOMEPAGE="http://raa.ruby-lang.org/project/rss"
SRC_URI="http://www.cozmixng.org/~kou/download/${P}.tar.gz"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"

USE_RUBY="ruby18"

src_install() {
	RUBY_ECONF="${RUBY_ECONF} ${EXTRA_ECONF}"

	${RUBY} setup.rb config --prefix=/usr "$@" \
		${RUBY_ECONF} || die "setup.rb config failed"
	${RUBY} setup.rb install --prefix=${D} "$@" \
		${RUBY_ECONF} || die "setup.rb install failed"
}
