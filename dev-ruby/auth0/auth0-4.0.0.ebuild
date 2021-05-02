# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby client library for the Auth0 API"
HOMEPAGE="https://github.com/auth0/ruby-auth0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httmultiparty-0.3.16"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/fuubar-2.0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.5"
ruby_add_rdepend ">=dev-ruby/dotenv-rails-2.0"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/pry-nav-0.2.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/faker-1.4"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/gem-release-0.7"

