# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Swagger UI as Rails Engine for grape-swagger gem"
HOMEPAGE="https://github.com/ruby-grape/grape-swagger-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.2.12"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/git-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/grape-0"
ruby_add_rdepend ">=dev-ruby/grape-swagger-0.7.2"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0"
ruby_add_rdepend ">=dev-ruby/sass-rails-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/coffee-rails-0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-0"
ruby_add_rdepend ">=dev-ruby/grape-swagger-ui-0"
ruby_add_rdepend ">=dev-ruby/sprockets-0"
ruby_add_rdepend ">=dev-ruby/rack-1.6"
ruby_add_rdepend ">=dev-ruby/rack-cors-0"
ruby_add_rdepend "=dev-ruby/rubocop-0.33.0"
ruby_add_rdepend "<dev-ruby/mime-types-3.0"
ruby_add_rdepend ">=dev-ruby/rack-no_animations-0"

