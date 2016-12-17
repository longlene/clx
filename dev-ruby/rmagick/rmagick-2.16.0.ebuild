# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RMagick is an interface between Ruby and ImageMagick"
HOMEPAGE="https://github.com/rmagick/rmagick"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.33.0"
ruby_add_rdepend ">=dev-ruby/test-unit-2"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"

