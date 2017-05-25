# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Prawn is a fast, tiny, and nimble PDF generator for Ruby
"
HOMEPAGE="http://prawnpdf.org"

LICENSE="PRAWN GPL-2.0 GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ttfunk-1.5"
ruby_add_rdepend ">=dev-ruby/pdf-core-0.7.0"
ruby_add_rdepend ">=dev-ruby/pdf-inspector-1.2.1"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/prawn-manual_builder-0.2.0"
ruby_add_rdepend ">=dev-ruby/pdf-reader-1.4"
ruby_add_rdepend ">=dev-ruby/rubocop-0.47.1"
ruby_add_rdepend ">=dev-ruby/rubocop-rspec-1.10"

