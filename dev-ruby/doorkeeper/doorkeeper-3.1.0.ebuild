# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Doorkeeper is an OAuth 2 provider for Rails and Grape"
HOMEPAGE="https://github.com/doorkeeper-gem/doorkeeper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.2"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.4.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.3.0"
ruby_add_rdepend ">=dev-ruby/generator_spec-0.9.0"
ruby_add_rdepend ">=dev-ruby/factory_girl-4.5.0"
ruby_add_rdepend ">=dev-ruby/timecop-0.7.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.3.0"

