# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Automatic Ruby code style checking tool."
HOMEPAGE="http://github.com/bbatsov/rubocop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/rainbow-1.1.4
	>=dev-ruby/parser-2.1
	>=dev-ruby/powerpack-0.0.6"

each_ruby_install() {
	each_fakegem_install
	ruby_fakegem_doins -r config
}
