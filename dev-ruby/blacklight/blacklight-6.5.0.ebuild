# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Blacklight is an open source Solr user interface discovery platform"
HOMEPAGE="http://projectblacklight.org/"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.2"
ruby_add_rdepend ">=dev-ruby/globalid-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/kaminari-0.15"
ruby_add_rdepend ">=dev-ruby/rsolr-1.0"
ruby_add_rdepend ">=dev-ruby/bootstrap-sass-3.2"
ruby_add_rdepend ">=dev-ruby/deprecation-0"
ruby_add_rdepend ">=dev-ruby/twitter-typeahead-rails-0.11.1"
ruby_add_rdepend ">=dev-ruby/solr_wrapper-0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.5"
ruby_add_rdepend ">=dev-ruby/rspec-its-0"
ruby_add_rdepend ">=dev-ruby/rspec-collection_matchers-1.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.6.0"
ruby_add_rdepend ">=dev-ruby/poltergeist-0"
ruby_add_rdepend ">=dev-ruby/engine_cart-0.10"
ruby_add_rdepend ">=dev-ruby/equivalent-xml-0"

