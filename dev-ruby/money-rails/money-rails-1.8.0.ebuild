# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This library provides integration of RubyMoney - Money gem with Rails"
HOMEPAGE="https://github.com/RubyMoney/money-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/money-6.8.1"
ruby_add_rdepend ">=dev-ruby/monetize-1.6.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/rails-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0.8.0"

