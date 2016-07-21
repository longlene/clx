# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RDF"
HOMEPAGE="http://ruby-rdf.github.com/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/link_header-0.0"
ruby_add_rdepend ">=dev-ruby/hamster-3.0"
ruby_add_rdepend ">=dev-ruby/rdf-spec-2.0"
ruby_add_rdepend ">=dev-ruby/rdf-vocab-2.0"
ruby_add_rdepend ">=dev-ruby/rdf-xsd-2.0"
ruby_add_rdepend ">=dev-ruby/rest-client-1.7"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.17"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/faraday-0.9"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9"

