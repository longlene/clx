# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A toolkit for publishing scientific results and datasets using RDF, OWL, and related technologies "
HOMEPAGE="http://github.com/wstrinz/publisci"

LICENSE="BSD 2-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/rdf-0"
ruby_add_rdepend ">=dev-ruby/rdf-4store-0"
ruby_add_rdepend ">=dev-ruby/rdf-turtle-0"
ruby_add_rdepend ">=dev-ruby/rdf-rdfxml-0"
ruby_add_rdepend ">=dev-ruby/json-ld-0"
ruby_add_rdepend ">=dev-ruby/rserve-client-0"
ruby_add_rdepend ">=dev-ruby/sparql-0"
ruby_add_rdepend ">=dev-ruby/spira-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.8.0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/jeweler-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.21"
ruby_add_rdepend ">=dev-ruby/bio-1.4.2"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/spoon-0"

