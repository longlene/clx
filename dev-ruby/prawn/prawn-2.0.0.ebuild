# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Prawn is a fast, tiny, and nimble PDF generator for Ruby
"
HOMEPAGE="http://prawn.majesticseacreature.com"

LICENSE="RUBY GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ttfunk-1.4.0"
ruby_add_rdepend ">=dev-ruby/pdf-core-0.5.0"
ruby_add_rdepend ">=dev-ruby/pdf-inspector-1.2.0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend "=dev-ruby/rspec-2.14.1"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/prawn-manual_builder-0.2.0"
ruby_add_rdepend ">=dev-ruby/pdf-reader-1.2"
ruby_add_rdepend "=dev-ruby/rubocop-0.28.0"
ruby_add_rdepend "=dev-ruby/code_statistics-0.2.13"

