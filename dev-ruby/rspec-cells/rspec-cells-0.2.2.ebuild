# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Use render_cell in your specs"
HOMEPAGE="http://rubygems.org/gems/rspec-cells"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.14"
ruby_add_rdepend ">=dev-ruby/cells-3.4.0"

