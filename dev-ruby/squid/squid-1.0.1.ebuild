# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Squid expands Prawn providing method to easily draw graphs in PDF files"
HOMEPAGE="https://github.com/fullscreen/squid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/prawn-2.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.0"
ruby_add_rdepend ">=dev-ruby/pdf-inspector-1.2"
ruby_add_rdepend ">=dev-ruby/prawn-manual_builder-0.2.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8.2"
ruby_add_rdepend ">=dev-ruby/pry-nav-0.2.4"

