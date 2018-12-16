# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="  Daru (Data Analysis in RUby) is a library for analysis, manipulation and
  visualization of data"
HOMEPAGE="https://github.com/Shekharrajak/daru-view"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/google_visualr-0"
ruby_add_rdepend ">=dev-ruby/lazy_high_charts-0"
ruby_add_rdepend ">=dev-ruby/daru-0"
ruby_add_rdepend ">=dev-ruby/nyaplot-0"
ruby_add_rdepend ">=dev-ruby/daru-data_tables-0"
ruby_add_rdepend ">=dev-ruby/actionview-0"

