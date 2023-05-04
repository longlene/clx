# Copyright 1999-2009 Gentoo Foundation

EAPI=7

USE_RUBY="ruby32"
inherit ruby-fakegem

DESCRIPTION="A cross-platform multimedia library for ruby"
HOMEPAGE="http://rubygame.org/"

LICENSE="LGPL-2.1"
SLOT="0"
kEYWORDS="~x86 ~amd64"
IUSE="doc"
RDEPEND="media-libs/libsdl[X]
media-libs/sdl-gfx
media-libs/sdl-image[jpeg,png]
media-libs/sdl-ttf
media-libs/sdl-mixer"
DEPEND="${RDEPEND}
dev-ruby/rake"

