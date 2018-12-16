# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Super simple and fast PDF invoicing in pure Ruby (based on Prawn library)"
HOMEPAGE="https://github.com/strzibny/invoice_printer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-2.1"
ruby_add_rdepend ">=dev-ruby/roda-3.5.0"
ruby_add_rdepend ">=dev-ruby/puma-3.9"
ruby_add_rdepend ">=dev-ruby/prawn-2.1.0"
ruby_add_rdepend ">=dev-ruby/prawn-layout-0.8.4"
