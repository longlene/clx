# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This is a library to read/write Google Spreadsheet"
HOMEPAGE="https://github.com/gimite/google-spreadsheet-ruby"

LICENSE="New BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/google_drive-0.3.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.0"

