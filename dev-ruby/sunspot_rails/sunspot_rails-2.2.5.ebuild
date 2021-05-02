# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Sunspot::Rails is an extension to the Sunspot library for Solr search"
HOMEPAGE="http://github.com/outoftime/sunspot/tree/master/sunspot_rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3"
ruby_add_rdepend "=dev-ruby/sunspot-2.2.5"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/rspec-1.2"
ruby_add_rdepend ">=dev-ruby/rspec-rails-1.2"

