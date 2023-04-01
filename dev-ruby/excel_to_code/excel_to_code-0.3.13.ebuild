# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="excel_to_code Converts some excel spreadsheets"
HOMEPAGE="http://github.com/tamc/excel_to_code"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubypeg-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.7"
ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/ox-2.0"

