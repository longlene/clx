# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

USE_RUBY="ruby18"
EAPI="2"
inherit gems

DESCRIPTION="A cross-platform multimedia library for ruby"
HOMEPAGE="http://rubygame.org/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"
RDEPEND="media-libs/libsdl[X]
	 media-libs/sdl-gfx
	 media-libs/sdl-image[jpeg,png]
	 media-libs/sdl-ttf
	 media-libs/sdl-mixer"
DEPEND="${RDEPEND}
	dev-ruby/rake"

