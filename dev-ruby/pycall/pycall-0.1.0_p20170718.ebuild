# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_COMMIT="3232c8d8367e433a9cb8a203f47e48b4495d5f37"

USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry is a powerful alternative to the standard IRB shell for Ruby"
HOMEPAGE="https://github.com/pry/pry/wiki"
SRC_URI="https://github.com/pry/pry/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
IUSE=""
SLOT="0"

LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86"

ruby_add_rdepend "
	dev-ruby/ffi
"
all_ruby_prepare() {
	sed -e '/git ls-files/d' \
		-e 's/~>/>=/' \
		-e '/bundler/d' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}
