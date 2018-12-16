# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Comprehensive import/export tools between Excel/CSV & ActiveRecord Databases, Rails apps, and any Ruby project"
HOMEPAGE="http://github.com/autotelik/datashift"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/spreadsheet-0"
ruby_add_rdepend ">=dev-ruby/rubyzip-0"

