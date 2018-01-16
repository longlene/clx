# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Uses wkhtmltopdf to create PDFs using HTML"
HOMEPAGE="https://github.com/pdfkit/pdfkit"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.8"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.10"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.6"
ruby_add_rdepend ">=dev-ruby/i18n-0.6.11"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

