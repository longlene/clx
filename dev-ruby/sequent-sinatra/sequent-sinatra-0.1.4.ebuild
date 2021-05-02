# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sequent is an event sourcing framework for Ruby"
HOMEPAGE="https://github.com/zilverline/sequent-sinatra"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequent-0.1"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/rack_csrf-2.5"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-3.2"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1.1"
ruby_add_rdepend ">=dev-ruby/rspec-html-matchers-0.7"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/pry-0.10"

