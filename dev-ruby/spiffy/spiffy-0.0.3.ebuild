# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A markup to HTML & PDF converter"
HOMEPAGE="http://rubygems.org/gems/hola"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/github-markup-1.3"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.2"
ruby_add_rdepend ">=dev-ruby/RedCloth-4.2"
ruby_add_rdepend ">=dev-ruby/rdoc-3.6.1"
ruby_add_rdepend ">=dev-ruby/org-ruby-0.9"
ruby_add_rdepend ">=dev-ruby/creole-0.5"
ruby_add_rdepend ">=dev-ruby/wikicloth-0.8"
ruby_add_rdepend ">=dev-ruby/asciidoctor-1.5"
ruby_add_rdepend ">=dev-ruby/haml-4.0"

